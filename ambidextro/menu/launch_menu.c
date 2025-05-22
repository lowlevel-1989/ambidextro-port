#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>

#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480
#define FONT_SIZE 24
#define MAX_OPTIONS 100

const SDL_Color WHITE  = {255, 255, 255, 255};
const SDL_Color YELLOW = {255, 255,   0, 255};

char *menu_options[MAX_OPTIONS];
int option_count = 0;

bool load_menu(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        fprintf(stderr, "Error opening menu file: %s\n", filename);
        return false;
    }

    char line[256];
    while (fgets(line, sizeof(line), file) && option_count < MAX_OPTIONS - 1) {
        line[strcspn(line, "\n")] = 0;  // Remove newline
        if (strlen(line) == 0) continue; // Skip empty lines

        menu_options[option_count] = strdup(line);
        if (!menu_options[option_count]) {
            fprintf(stderr, "Memory allocation error.\n");
            fclose(file);
            return false;
        }

        printf("Loaded menu option [%d]: %s\n", option_count, menu_options[option_count]);
        option_count++;
    }
    fclose(file);

    menu_options[option_count] = strdup("Exit");
    if (!menu_options[option_count]) {
        fprintf(stderr, "Memory allocation error.\n");
        return false;
    }
    option_count++;

    return true;
}

void render_menu(SDL_Renderer *renderer, TTF_Font *font, int selected) {
    SDL_RenderClear(renderer);
    int y = 15;

    for (int i = 0; i < option_count; i++) {
        if (!menu_options[i]) continue;

        SDL_Surface *text_surface = TTF_RenderText_Solid(
            font,
            menu_options[i],
            (i == selected) ? YELLOW : WHITE
        );

        if (!text_surface) {
            fprintf(stderr, "Failed to render text [%s]: %s\n", menu_options[i], TTF_GetError());
            continue;
        }

        SDL_Texture *text_texture = SDL_CreateTextureFromSurface(renderer, text_surface);
        SDL_Rect dst = {15, y, text_surface->w, text_surface->h};
        SDL_RenderCopy(renderer, text_texture, NULL, &dst);
        SDL_FreeSurface(text_surface);
        SDL_DestroyTexture(text_texture);
        y += 35;
    }

    SDL_RenderPresent(renderer);
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Usage: %s <menu_file.txt> <font.ttf>\n", argv[0]);
        return 1;
    }

    const char *menu_file = argv[1];
    const char *font_file = argv[2];

    if (!load_menu(menu_file)) {
        fprintf(stderr, "Failed to load menu file\n");
        return 1;
    }

    if (SDL_Init(SDL_INIT_VIDEO) != 0 || TTF_Init() != 0) {
        fprintf(stderr, "SDL or TTF init failed: %s\n", SDL_GetError());
        return 1;
    }

    SDL_Window *window = SDL_CreateWindow(
        "Launch Menu",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        SCREEN_WIDTH, SCREEN_HEIGHT,
        SDL_WINDOW_BORDERLESS
    );
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 0);

    TTF_Font *font = TTF_OpenFont(font_file, FONT_SIZE);
    if (!font) {
        fprintf(stderr, "Failed to load font '%s': %s\n", font_file, TTF_GetError());
        return 1;
    }

    int selected = 0;
    int exitcode = 0;

    bool running = true;
    SDL_Event e;

    while (running) {
        render_menu(renderer, font, selected);

        while (SDL_PollEvent(&e)) {
            if (e.type == SDL_QUIT) running = false;
            if (e.type == SDL_KEYDOWN) {
                switch (e.key.keysym.sym) {
                    case SDLK_UP:
                        selected = (selected - 1 + option_count) % option_count;
                        break;
                    case SDLK_DOWN:
                        selected = (selected + 1) % option_count;
                        break;
                    case SDLK_RETURN:
                        if (strcmp(menu_options[selected], "Exit") == 0) {
                            running = false;
                            exitcode = 0;
                        } else {
                            printf("[MENU] You selected: %s\n", menu_options[selected]);
                            exitcode = selected + 2;
                            running = false;
                        }
                        break;
                }
            }
        }

        SDL_Delay(100);
    }

    for (int i = 0; i < option_count; i++) {
        free(menu_options[i]);
    }

    TTF_CloseFont(font);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    TTF_Quit();
    SDL_Quit();

    return exitcode;
}

