// RaylibShim.c : Defines the functions for the static library.
//

#include <stdio.h>
#include "raylib.h"
#include "rlgl.h"

//////////////// GENERAL

// RLAPI Vector2 GetWindowPosition(void);
void GetWindowPositionA(Vector2* v)
{
	*v = GetWindowPosition();
}

// RLAPI Vector2 GetWindowScaleDPI(void);
void GetWindowScaleDPIA(Vector2* v)
{
	*v = GetWindowScaleDPI();
}

//////////////// IMAGE

// RLAPI Image GenImageColor(int width, int height, Color color);
void GenImageColorA(int width, int height, Color color, Image* i)
{
	*i = GenImageColor(width, height, color);
}

// RLAPI Image LoadImage(const char* fileName);
void LoadImageA(const char* fileName, Image* i)
{
	*i = LoadImage(fileName);
}

// RLAPI void UnloadImage(Image image);
void UnloadImageA(Image* image)
{
	UnloadImage(*image);
}

//////////////// TEXTURE

// RLAPI Texture2D LoadTexture(const char* fileName)
void LoadTextureA(const char* fileName, Texture2D* t)
{
	*t = LoadTexture(fileName);
}

// RLAPI Texture2D LoadTextureFromImage(Image image);
void LoadTextureFromImageA(Image* image, Texture2D* t)
{
	*t = LoadTextureFromImage(*image);
}

// RLAPI void DrawTexturePro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint);
void DrawTextureProA(Texture2D* texture, Rectangle* source, Rectangle* dest, Vector2* origin, float rotation, Color tint)
{
	DrawTexturePro(*texture, *source, *dest, *origin, rotation, tint);
}

// RLAPI void UpdateTexture(Texture2D texture, const void* pixels);
void UpdateTextureA(Texture2D* texture, const void* pixels)
{
	UpdateTexture(*texture, pixels);
}

//RLAPI void SetTextureFilter(Texture2D texture, int filter)
void SetTextureFilterA(Texture2D* texture, int filter)
{
	SetTextureFilter(*texture, filter);
}

// RLAPI void UnloadTexture(Texture2D texture);
void UnloadTextureA(Texture2D* texture)
{
	UnloadTexture(*texture);
}

//////////////// RENDERTEXTURE

//RLAPI RenderTexture2D LoadRenderTexture(int width, int height);
void LoadRenderTextureA(int width, int height, RenderTexture2D* rt)
{
	*rt = LoadRenderTexture(width, height);
}

//RLAPI void UnloadRenderTexture(RenderTexture2D target);
void UnloadRenderTextureA(RenderTexture2D* target)
{
	UnloadRenderTexture(*target);
}

//RLAPI void BeginTextureMode(RenderTexture2D target);
void BeginTextureModeA(RenderTexture2D* target)
{
	BeginTextureMode(*target);
}

//////////////// SHAPES

//drawRectangleV
//drawRing
//drawCircle

//////////////// SHADER

// RLAPI void UnloadShader(Shader shader);
void UnloadShaderA(Shader* shader)
{
	UnloadShader(*shader);
}

// RLAPI Shader LoadShader(const char* vsFileName, const char* fsFileName);
LoadShaderA(const char* vsFileName, const char* fsFileName, Shader* s)
{
	*s = LoadShader(vsFileName, fsFileName);
}

// RLAPI int GetShaderLocation(Shader shader, const char* uniformName)
int GetShaderLocationA(Shader* shader, const char* uniformName)
{
	return GetShaderLocation(*shader, uniformName);
}

//RLAPI int GetShaderLocationAttrib(Shader shader, const char *attribName)
int GetShaderLocationAttribA(Shader* shader, const char* attribName)
{
	return GetShaderLocationAttrib(*shader, attribName);
}

// RLAPI void SetShaderValue(Shader shader, int locIndex, const void* value, int uniformType)
void SetShaderValueA(Shader* shader, int locIndex, const void* value, int uniformType)
{
	SetShaderValue(*shader, locIndex, value, uniformType);
}

// RLAPI void BeginShaderMode(Shader shader);
void BeginShaderModeA(Shader* shader)
{
	BeginShaderMode(*shader);
}

//////////////// SHAPES

//RLAPI void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color)
void DrawRingA(Vector2* center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color)
{
	DrawRing(*center, innerRadius, outerRadius, startAngle, endAngle, segments, color);
}
 
//RLAPI void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color)
void DrawTriangleA(Vector2* v1, Vector2* v2, Vector2* v3, Color color)
{
	DrawTriangle(*v1, *v2, *v3, color);
}

//////////////// SOUND

//RLAPI Sound LoadSound(const char* fileName)
void LoadSoundA(const char* fileName, Sound* s)
{	
	*s = LoadSound(fileName);
	/*
	printf("rAudioBuffer_ptr in C: %p\n", s->stream.buffer);
	printf("rAudioProcessor_ptr in C: %p\n", s->stream.processor);
	printf("samplerate in C: %lu\n", s->stream.sampleRate);
	printf("samplesize in C: %lu\n", s->stream.sampleSize);
	printf("channels in C: %lu\n", s->stream.channels);
	printf("framecount in C: %lu\n", s->frameCount);
	*/
}

//RLAPI void PlaySound(Sound sound)
void PlaySoundA(Sound* s)
{
	PlaySound(*s);
}

//RLAPI void PlaySoundMulti(Sound sound)
void PlaySoundMultiA(Sound* s)
{
	PlaySoundMulti(*s);
}

//RLAPI void StopSound(Sound sound)
void StopSoundA(Sound* s)
{
	StopSound(*s);
}

//RLAPI void UnloadSound(Sound sound)
void UnloadSoundA(Sound* s)
{
	UnloadSound(*s);
}

//RLAPI bool IsSoundPlaying(Sound sound)
bool IsSoundPlayingA(Sound* s)
{
	return IsSoundPlaying(*s);
}

//RLAPI void SetSoundVolume(Sound sound, float volume)
void SetSoundVolumeA(Sound* s, float volume)
{
	SetSoundVolume(*s, volume);
}

//RLAPI void SetSoundPitch(Sound sound, float pitch)
void SetSoundPitchA(Sound* s, float pitch)
{
	SetSoundPitch(*s, pitch);
}

//RLAPI Music LoadMusicStream(const char *fileName)
void LoadMusicStreamA(const char* fileName, Music* m)
{
	*m = LoadMusicStream(fileName);
	/*
	printf("rAudioBuffer_ptr in C: %p\n", m->stream.buffer);
	printf("rAudioProcessor_ptr in C: %p\n", m->stream.processor);
	printf("samplerate in C: %d\n", m->stream.sampleRate);
	printf("samplesize in C: %d\n", m->stream.sampleSize);
	printf("channels in C: %d\n", m->stream.channels);
	printf("framecount in C: %d\n", m->frameCount);
	printf("looping in C: %i\n", m->looping);
	printf("ctxType in C: %i\n", m->ctxType);
	printf("ctxData in C: %p\n", m->ctxData);
	*/
}

//RLAPI bool IsMusicStreamPlaying(Music music)
bool IsMusicStreamPlayingA(Music* m)
{
	return IsMusicStreamPlaying(*m);
}

//RLAPI void PlayMusicStream(Music music)
void PlayMusicStreamA(Music* m)
{
	PlayMusicStream(*m);
}

//RLAPI void UpdateMusicStream(Music music)
void UpdateMusicStreamA(Music* m)
{
	UpdateMusicStream(*m);
}

//RLAPI void StopMusicStream(Music music)
void StopMusicStreamA(Music* m)
{
	StopMusicStream(*m);
}

//RLAPI void PauseMusicStream(Music music)
void PauseMusicStreamA(Music* m)
{
	PauseMusicStream(*m);
}

//RLAPI void ResumeMusicStream(Music music)
void ResumeMusicStreamA(Music* m)
{
	ResumeMusicStream(*m);
}

//RLAPI void SeekMusicStream(Music music, float position)
void SeekMusicStreamA(Music* m, float position)
{
	SeekMusicStream(*m, position);
}

//RLAPI void SetMusicVolume(Music music, float volume)
void SetMusicVolumeA(Music* m, float volume)
{
	SetMusicVolume(*m, volume);
}

//RLAPI void SetMusicPitch(Music music, float pitch)
void SetMusicPitchA(Music* m, float pitch)
{
	SetMusicPitch(*m, pitch);
}

//RLAPI void UnloadMusicStream(Music music)
void UnloadMusicStreamA(Music* m)
{
	UnloadMusicStream(*m);
}

//////////////// FONT

// RLAPI Font LoadFont(const char* fileName)
void LoadFontA(const char* fileName, Font* f)
{
	*f = LoadFont(fileName);
}

// RLAPI Font LoadFontEx(const char* fileName, int fontSize, int* fontChars, int glyphCount)
void LoadFontExA(const char* fileName, int fontSize, int* fontChars, int glyphCount, Font* f)
{
	*f = LoadFontEx(fileName, fontSize, fontChars, glyphCount);
}

// RLAPI void UnloadFont(Font font);
void UnloadFontA(Font* font)
{
	UnloadFont(*font);
}

//RLAPI void DrawTextEx(Font font, const char* text, Vector2 position, float fontSize, float spacing, Color tint)
void DrawTextExA(Font* font, const char* text, Vector2* position, float fontSize, float spacing, Color tint)
{
	DrawTextEx(*font, text, *position, fontSize, spacing, tint);
}

//////////////// MATRIX VECTOR FUNCS

void rlGetMatrixModelviewA(float* mat)
{
	Matrix m = rlGetMatrixModelview();
	mat[0]  = m.m0;
	mat[1]  = m.m4;
	mat[2]  = m.m8;
	mat[3]  = m.m12;
	mat[4]  = m.m1;
	mat[5]  = m.m5;
	mat[6]  = m.m9;
	mat[7]  = m.m13;
	mat[8]  = m.m2;
	mat[9]  = m.m6;
	mat[10] = m.m10;
	mat[11] = m.m14;
	mat[12] = m.m3;
	mat[13] = m.m7;
	mat[14] = m.m11;
	mat[15] = m.m15;
}

void rlGetMatrixProjectionA(float* mat)
{
	Matrix m = rlGetMatrixProjection();
	mat[0]  = m.m0;
	mat[1]  = m.m4;
	mat[2]  = m.m8;
	mat[3]  = m.m12;
	mat[4]  = m.m1;
	mat[5]  = m.m5;
	mat[6]  = m.m9;
	mat[7]  = m.m13;
	mat[8]  = m.m2;
	mat[9]  = m.m6;
	mat[10] = m.m10;
	mat[11] = m.m14;
	mat[12] = m.m3;
	mat[13] = m.m7;
	mat[14] = m.m11;
	mat[15] = m.m15;
}

//////////////// DEBUGSTUFFS

void DebugArray(float arr[3][3])
{
	printf("%.4f %.4f %.4f\n", arr[0][0], arr[0][1], arr[0][2]);
	printf("%.4f %.4f %.4f\n", arr[1][0], arr[1][1], arr[1][2]);
	printf("%.4f %.4f %.4f\n", arr[2][0], arr[2][1], arr[2][2]);
}

void DebugMatrix(Matrix* m)
{
	printf("(%.4f %.4f %.4f %.4f)\n", m->m0, m->m4, m->m8, m->m12);
	printf("(%.4f %.4f %.4f %.4f)\n", m->m1, m->m5, m->m9, m->m13);
	printf("(%.4f %.4f %.4f %.4f)\n", m->m2, m->m6, m->m10, m->m14);
	printf("(%.4f %.4f %.4f %.4f)\n", m->m3, m->m7, m->m11, m->m15);
}

void DebugMatrixArr(float arr[16])
{
	printf("(%.4f %.4f %.4f %.4f)\n", arr[0], arr[1], arr[2], arr[3]);
	printf("(%.4f %.4f %.4f %.4f)\n", arr[4], arr[5], arr[6], arr[7]);
	printf("(%.4f %.4f %.4f %.4f)\n", arr[8], arr[9], arr[10], arr[11]);
	printf("(%.4f %.4f %.4f %.4f)\n", arr[12], arr[13], arr[14], arr[15]);
}

void DebugStructs()
{
	printf("=====RAYLIB STRUCT SIZES\n");
	printf("sizeof(Vector2) = %zu\n", sizeof(Vector2));
	printf("sizeof(Vector3) = %zu\n", sizeof(Vector3));
	printf("sizeof(Vector4) = %zu\n", sizeof(Vector4));
	printf("sizeof(Matrix) = %zu\n", sizeof(Matrix));
	printf("sizeof(Color) = %zu\n", sizeof(Color));
	printf("sizeof(Rectangle) = %zu\n", sizeof(Rectangle));
	printf("sizeof(Shader) = %zu\n", sizeof(Shader));
	printf("sizeof(Font) = %zu\n", sizeof(Font));
	printf("sizeof(Image) = %zu\n", sizeof(Image));
	printf("sizeof(Texture) = %zu\n", sizeof(Texture));
	printf("sizeof(RenderTexture2D) = %zu\n", sizeof(RenderTexture2D));
	printf("sizeof(AudioStream) = %zu\n", sizeof(AudioStream));
	printf("sizeof(Sound) = %zu\n", sizeof(Sound));
	printf("sizeof(Music) = %zu\n", sizeof(Music));
	printf("========================\n");
}
