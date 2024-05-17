/*
 * Sanath Kumar (sk2794@cornell.edu)
 * Pawan Perera (pp497@cornell.edu)
 * Chris Yang (cy524@cornell.edu)
 *
 * Cornell University
 * ECE 5760 - Advanced Microcontroller Design
 * Spring 2024
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/ipc.h> 
#include <sys/shm.h> 
#include <sys/mman.h>
#include <sys/time.h> 
#include <math.h>

// video display
#define SDRAM_BASE            0xC0000000
#define SDRAM_END             0xC3FFFFFF
#define SDRAM_SPAN			  0x04000000
// characters
#define FPGA_CHAR_BASE        0xC9000000 
#define FPGA_CHAR_END         0xC9001FFF
#define FPGA_CHAR_SPAN        0x00002000
/* Cyclone V FPGA devices */
#define HW_REGS_BASE          0xC0000000
#define HW_REGS_SPAN          0x00200000 


// Base and offset address declarations
#define FPGA_AXI_BASE 0xC0000000
#define FPGA_AXI_SPAN 0x00001000
#define FPGA_LW_BASE 0xff200000
#define FPGA_LW_SPAN 0x00001000
#define FPGA_40960_W_OFFSET 0x00000000
#define FPGA_512_OFFSET 0x00040000
#define FPGA_32a_OFFSET 0x00040400
#define FPGA_32b_OFFSET 0x00040440
#define FPGA_40960_B_OFFSET 0x00020000

#define PIO_READY1_OFFSET 0x00050500
#define PIO_READY2_OFFSET 0x00050600
#define PIO_READY3_OFFSET 0x00050700
#define PIO_READY4_OFFSET 0x00050800

#define PIO_TRIGGER1_OFFSET 0x00050900
#define PIO_TRIGGER2_OFFSET 0x00051000
#define PIO_TRIGGER3_OFFSET 0x00051100

#define PIO_RESET_OFFSET 0x00051200
#define PIO_EVAL_OFFSET 0x00051300
#define PIO_BIAS_OFFSET 0x00051400


// Initialize fixed point
typedef signed int fix13;
#define float2fix13(a) ((fix13)((a)*8192.0)) // 2^13
#define fix2float13(a) ((float)((a)/8192.0))

typedef signed int fix5;
#define float2fix5(a) ((fix5)((a)*32.0)) // 2^5
#define fix2float5(a) ((float)((a)/32.0))


//write to M10k
volatile char * weights40960_w_ptr = NULL ;
volatile char * weights40960_b_ptr = NULL ;
volatile char * weights512_ptr = NULL ;
volatile char * weights32a_ptr = NULL ;
volatile char * weights32b_ptr = NULL ;

//output from hps
volatile unsigned char * ready1_ptr = NULL ;
volatile unsigned char * ready2_ptr = NULL ;
volatile unsigned char * ready3_ptr = NULL ;
volatile unsigned char * ready4_ptr = NULL ;

//input to hps
volatile unsigned char * trigger1_ptr = NULL ;
volatile unsigned char * trigger2_ptr = NULL ;
volatile unsigned char * trigger3_ptr = NULL ;

volatile unsigned char * pio_reset_ptr = NULL ;
volatile int * pio_eval_ptr = NULL ;
volatile int * pio_bias_ptr = NULL ;

void *h2p_lw_virtual_base;

// Variable and counter declarations
int fd;
int i;
int j;
int k;
int row_counter_40960_w = 0;
int row_counter_40960_b = 0;
int row_counter_512 = 0;
int row_counter_32a = 0;
int counter = 0;

// M10K 2d array declarations
float weights40960w[256][40960];
float bias40960w[256];

float weights40960b[256][40960];
float bias40960b[256];

float weights512[32][512];
float bias512[32];

float weights32a[32][32];
float bias32a[32];

float weights32b[32];
float bias32b;


int main(void)
{

    // Open /dev/mem
        if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) 	{
            printf( "ERROR: could not open \"/dev/mem\"...\n" );
            return( 1 );
        }

    // get virtual addr that maps to physical
        // for light weight bus
        h2p_lw_virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );	
        if( h2p_lw_virtual_base == MAP_FAILED ) {
            printf( "ERROR: mmap1() failed...\n" );
            close( fd );
            return(1);
        }

    // Set pointer addresses

    //M10K
    weights40960_w_ptr = (char *)(h2p_lw_virtual_base + FPGA_40960_W_OFFSET);
    weights40960_b_ptr = (char *)(h2p_lw_virtual_base + FPGA_40960_B_OFFSET);
    weights512_ptr = (char *)(h2p_lw_virtual_base + FPGA_512_OFFSET);
    weights32a_ptr = (char *)(h2p_lw_virtual_base + FPGA_32a_OFFSET);
    weights32b_ptr = (char *)(h2p_lw_virtual_base + FPGA_32b_OFFSET);

    //output
    ready1_ptr = (unsigned char *)(h2p_lw_virtual_base + PIO_READY1_OFFSET);
    ready2_ptr = (unsigned char *)(h2p_lw_virtual_base + PIO_READY2_OFFSET);
    ready3_ptr = (unsigned char *)(h2p_lw_virtual_base + PIO_READY3_OFFSET);
    ready4_ptr = (unsigned char *)(h2p_lw_virtual_base + PIO_READY4_OFFSET);

    //input
    trigger1_ptr = (unsigned char *)(h2p_lw_virtual_base + PIO_TRIGGER1_OFFSET);
    trigger2_ptr = (unsigned char *)(h2p_lw_virtual_base + PIO_TRIGGER2_OFFSET);
    trigger3_ptr = (unsigned char *)(h2p_lw_virtual_base + PIO_TRIGGER3_OFFSET);

    pio_reset_ptr = (unsigned char *)(h2p_lw_virtual_base + PIO_RESET_OFFSET);
    pio_eval_ptr = ( int *)(h2p_lw_virtual_base + PIO_EVAL_OFFSET);
    pio_bias_ptr = ( int *)(h2p_lw_virtual_base + PIO_BIAS_OFFSET);


    // load weight and bias arrays with default values

    for (i = 0; i < 256; i++) {
        for (j = 0; j < 40960; j++) {
            weights40960w[i][j] = 0.125;
            weights40960b[i][j] = 0.125;
        }
        bias40960w[i] = 0.09375;
        bias40960b[i] = 0.09375;
    }

    for (i = 0; i < 32; i++) {
        for (j = 0; j < 512; j++) {
            weights512[i][j] = 0.5;
        }
        bias512[i] = 0.00;
        for (k = 0; k < 32; k++) {
            weights32a[i][k] = 0.5;
        }
        weights32b[i] = 0.5;
        bias512[i] = 0.25;
    }
    weights32b[32] = 0.5;
    bias32b = 0.25;


    // Initialize pointer values
    *(ready1_ptr) = 0;
    *(ready2_ptr) = 0;
    *(ready3_ptr) = 0;
    *(ready4_ptr) = 0;
    usleep(100000);

    // Pulse reset
    *(pio_reset_ptr) = 0;
    
    *(pio_reset_ptr) = 1;
    usleep(100000);

    *(ready1_ptr) = 0;
    *(ready2_ptr) = 0;
    *(ready3_ptr) = 0;
    *(ready4_ptr) = 0;
    usleep(100000);

    *(pio_reset_ptr) = 0;


    // First linear layers
    while(1) {
        // Wait for trigger1 from FPGA
        // Make sure this only happens 256 times (bug fix)
        if (((*trigger1_ptr) == 1) && counter < 256) {
            printf("begin trigger1\n");
            // Load rows of 40960 weights to M10Ks
            for (i = 0; i < 40960; i++) {
                *(weights40960_w_ptr + i*2) = float2fix13(weights40960w[row_counter_40960_w][i]);
                *(weights40960_b_ptr + i*2) = float2fix13(weights40960b[row_counter_40960_b][i]);
            }
            printf("Loading row done %d\n", row_counter_40960_w);

            // Load bias value, update row counter
            if ((row_counter_40960_w < 256) && (row_counter_40960_b < 256)) {
                *(pio_bias_ptr) = float2fix5(bias40960b[row_counter_40960_b]);
                row_counter_40960_w = row_counter_40960_w + 1;
                row_counter_40960_b = row_counter_40960_b + 1;
            }

            // Send ready1 to FPGA
            *(ready1_ptr) = 1;
            *(ready1_ptr) = 0;
            counter = counter + 1;
        }
        // Exit while loop after 256 rows
        else if (counter == 256) {
            break;
        }
    }
    usleep(10000);

    // Second linear layer
    while(1) {
        // Wait for trigger2 from FPGA
        if ((*trigger2_ptr) == 1) {
            printf("begin trigger2\n");
            // Load rows of 512 weights to M10K
            for (i = 0; i < 512; i++) {
                *(weights512_ptr + i*2) = float2fix5(weights512[row_counter_512][i]);
            }
            printf("Loading row done %d\n", row_counter_512);
            
            // Load bias value, update row counter
            if (row_counter_512 < 32) {
                *(pio_bias_ptr) = float2fix5(bias512[row_counter_512]);
                row_counter_512 = row_counter_512 + 1;
            }

            // Send ready2 to FPGA
            *(ready2_ptr) = 1;
            *(ready2_ptr) = 0;
        }
        // Exit while loop after 32 rows
        else if (row_counter_512 == 32) {
            break;
        }
    }
    usleep(10000);

    // Third linear layer
    while(1) {
        usleep(10);
        // Wait for trigger3 from FPGA
        if ((*trigger3_ptr) == 1) {
            printf("begin trigger3\n");
            // Load rows of 32 weights to M10K
            for (i = 0; i < 32; i++) {
                *(weights32a_ptr + i*2) = float2fix5(weights32a[row_counter_32a][i]);
            }
            printf("Loading row done %d\n", row_counter_32a);
            
            // Load bias value, update row counter
            if (row_counter_32a < 32) {
                *(pio_bias_ptr) = float2fix5(bias32a[row_counter_32a]);
                row_counter_32a = row_counter_32a + 1;
            }

            // Send ready3 to FPGA
            *(ready3_ptr) = 1;
            *(ready3_ptr) = 0;
        }
        // Exit while loop after 32 rows
        else if (row_counter_32a == 32) {
            break;
        }
    }
    usleep(10000);

    // Fourth linear layer
    // No while loop, only happens once
    if (row_counter_32a == 32) {
        // Don't have to wait for trigger from FPGA
        printf("begin final trigger\n");
        // Load row of 32 weights to M10K
        for (j = 0; j < 32; j++) {
            *(weights32b_ptr + j*2) = float2fix5(weights32b[j]);
        }
        printf("Loading row done\n ");

        // Load bias value
        *(pio_bias_ptr) = float2fix5(bias32b);

        // Send ready4 to FPGA
        *(ready4_ptr) = 1;
        *(ready4_ptr) = 0;

        // Print eval value
        printf("%f\n", fix2float13(*pio_eval_ptr));
    }
 
}
       

/*************************************************
 *                                               *
 *        Unfinished code for move inputs        *
 *                                               *
 *************************************************/


/*
    assign preindex_white = (piece_type << 1) + piece_color_white;
    assign preindex_black = (piece_type << 1) + piece_color_black;


    assign index_white = ( piece_square_white + ((preindex_white + (king_square_white << 3) + (king_square_white << 1)) << 6) );
    assign index_black = ( piece_square_black + ((preindex_black + (king_square_black << 3) + (king_square_black << 1)) << 6) );

char* board[8][8] = {
               {"wr","wn","wb","wq","wk","wb","wn","wr"}, //A
               {"wp","wp","wp","wp","wp","wp","wp","wp"}, //B
               {"  ","  ","  ","  ","  ","  ","  ","  "}, //C
               {"  ","  ","  ","  ","  ","  ","  ","  "}, //D
               {"  ","  ","  ","  ","  ","  ","  ","  "}, //E 
               {"  ","  ","  ","  ","  ","  ","  ","  "}, //F
               {"bp","bp","bp","bp","bp","bp","bp","bp"}, //G
               {"br","bn","bb","bq","bk","bb","bn","br"}  //H
    };

char* user_curr_square = "a2";
char* user_new_square = "a3";

printf("Select piece current square");
scanf("%s", &user_curr_square);

printf("Select piece new square");
scanf("%s", &user_new_square);

int curr_row, curr_column, new_row, new_column;
char curr_row_char = user_curr_square[0];
if (curr_row_char == 'a') {
    curr_row = 0;
}
else if (curr_row_char == 'b') {
    curr_row = 1;
}
else if (curr_row_char == 'c') {
    curr_row = 2;
}
else if (curr_row_char == 'd') {
    curr_row = 3;
}
else if (curr_row_char == 'e') {
    curr_row = 4;
}
else if (curr_row_char == 'f') {
    curr_row = 5;
}
else if (curr_row_char == 'g') {
    curr_row = 6;
}
else if (curr_row_char == 'h') {
    curr_row = 7;
}
curr_column = atoi(user_curr_square[1]);

char new_row_char = user_new_square[0];
if (new_row_char == 'a') {
    new_row = 0;
}
else if (new_row_char == 'b') {
    new_row = 1;
}
else if (new_row_char == 'c') {
    new_row = 2;
}
else if (new_row_char == 'd') {
    new_row = 3;
}
else if (new_row_char == 'e') {
    new_row = 4;
}
else if (new_row_char == 'f') {
    new_row = 5;
}
else if (new_row_char == 'g') {
    new_row = 6;
}
else if (new_row_char == 'h') {
    new_row = 7;
}
new_column = atoi(user_new_square[1]);

int piece_type, piece_color_white, piece_color_black, piece_square_white, piece_square_black, king_square_white, king_square_black;
char* target_piece;
target_piece = board[curr_row][curr_column];
if (target_piece[1] == 'p') {
    piece_type = 0;
}
else if (target_piece[1] == 'n') {
    piece_type = 1;
}
else if (target_piece[1] == 'b') {
    piece_type = 2;
}
else if (target_piece[1] == 'r') {
    piece_type = 3;
}
else if (target_piece[1] == 'q') {
    piece_type = 4;
}
//else if (target_piece[1] == 'k') {
    
//}

if (target_piece[0] == 'w') {
    piece_color_white = 0;
    piece_color_black = 1;
}
else if (target_piece[0] == 'b') {
    piece_color_white = 1;
    piece_color_black = 0;
}

board[curr_row][curr_column] = "  ";
board[new_row][new_column] = target_piece;

piece_square_white = (8*curr_row) + curr_column;
piece_square_black = 63 - piece_square_white;
king_square_white = 0;
king_square_black = 0;
*/
