/*******************************************************************************************
*
*   Modified raylib [models] example - Drawing large numbers of billboards at random positions
*
*   This example has been created using raylib 1.3 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2015 Ramon Santamaria (@raysan5)
*
********************************************************************************************/
#include <stddef.h>
#include <stdlib.h>
#include "raylib.h"

#define bb_num 8191 // 8190 works
Vector3 bbpos[bb_num];

int main(void)
{
    // Initialization
    //--------------------------------------------------------------------------------------
    const int screenWidth = 800;
    const int screenHeight = 450;

    InitWindow(screenWidth, screenHeight, "raylib [models] example - drawing billboards");

    // Define the camera to look into our 3d world
    Camera camera = { 0 };
    camera.position = (Vector3){ 5.0f, 4.0f, 5.0f };
    camera.target = (Vector3){ 0.0f, 2.0f, 0.0f };
    camera.up = (Vector3){ 0.0f, 1.0f, 0.0f };
    camera.fovy = 45.0f;

    Texture2D bill = LoadTexture("resources/billboard.png");     // Our texture billboard

    // setup random bill board positions    
    for (int i = 0; i < bb_num; i++)
    {
        bbpos[i] = (Vector3){100.0*((float)rand()/RAND_MAX) - 50.0, 100.0*((float)rand()/RAND_MAX) - 50.0, 100.0*((float)rand()/RAND_MAX) - 50.0};
    }

    SetCameraMode(camera, CAMERA_ORBITAL);  // Set an orbital camera mode
    SetTargetFPS(60);                       // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!WindowShouldClose())            // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------
        UpdateCamera(&camera);              // Update camera
        //----------------------------------------------------------------------------------
        // Draw
        //----------------------------------------------------------------------------------
        BeginDrawing();

            ClearBackground(RAYWHITE);
        
            BeginMode3D(camera);
        
                //DrawGrid(10, 1.0f);        // Draw a grid
                for (int i = 0; i < bb_num; i++) 
                {
                    DrawBillboard(camera, bill, bbpos[i], 1.0f, WHITE);
                }

            EndMode3D();
        
            DrawFPS(10, 10);
        
        EndDrawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    UnloadTexture(bill);        // Unload texture

    CloseWindow();              // Close window and OpenGL context
    //--------------------------------------------------------------------------------------

    return 0;
}