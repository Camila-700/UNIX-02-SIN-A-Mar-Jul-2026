#include <stdint.h>
#include <stddef.h>

static uint16_t* const VGA_MEMORY = (uint16_t*) 0xb8000;

static size_t row = 0;
static size_t column = 0;
static uint8_t color = 0x0F;

static uint16_t vga_entry(unsigned char character, uint8_t entry_color) {
    return (uint16_t) character | (uint16_t) entry_color << 8;
}

void clear(void) {
    for (size_t y = 0; y < 25; y++) {
        for (size_t x = 0; x < 80; x++) {
            VGA_MEMORY[y * 80 + x] = vga_entry(' ', color);
        }
    }

    row = 0;
    column = 0;
}

void set_color(uint8_t foreground, uint8_t background) {
    color = foreground | background << 4;
}

static void put_char(char character) {
    if (character == '\n') {
        column = 0;
        row++;
        return;
    }

    VGA_MEMORY[row * 80 + column] = vga_entry(character, color);
    column++;

    if (column >= 80) {
        column = 0;
        row++;
    }
}

void print_str(const char* text) {
    for (size_t i = 0; text[i] != '\0'; i++) {
        put_char(text[i]);
    }
}

void kernel_main(void) {
    clear();

    set_color(10, 0);
    print_str("Welcome to 64-bit kernel\n");

    set_color(15, 0);
    print_str("Integrative Project - UIDE\n");
    print_str("Group: Ashley Espinoza, Camila Lascano, Paula Simbaña\n");
    print_str("Kernel started in 64-bit long mode.\n");
}