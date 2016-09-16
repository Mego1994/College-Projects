#include <stdio.h>
#include <stdlib.h>
//#include <GL/freeglut.h>
//#include <GL/gl.h>
//#include <X11/X.h>
//#include <X11/keysym.h>
#include <math.h>
#include <GL/glut.h>
#include "glm.c"
#include "materials.h"

float windowWidth = 1024;
float windowHeight = 768;

float aspect = 1024/768;

GLfloat eye[] = { 1.1,1.7,4.6 };
GLfloat center[] = { 3.8,1.7,4.5 };
GLfloat up[] = {0,1,0};

GLfloat n[] = { 0.0, 0.0, 1.0 };
GLfloat light_ambient[] = { 0.0, 0.0, 0.0, 1.0 };
GLfloat light_diffuse[] = { 1.0, 1.0, 1.0, 1.0 };
GLfloat light_specular[] = { 1.0, 1.0, 1.0, 1.0 };
GLfloat light_position[] = { 17.0, 5.0, 10.0, 1.0 };
GLfloat light_position0[] = { 5.0, 1.7, 4.3, 1.0 };
GLfloat mat_amb_diff[] = { 1.0, 0.5, 0.8, 1.0 };
GLfloat mat_diff[] = { 0.0, 1, 0, 1.0 };
GLfloat mat_specular[] = { 1.0, 1.0, 1.0, 1.0 };
GLfloat shininess[] = { 50.0 }; // specular highlight

GLfloat no_mat[] = { 0.0, 0.0, 0.0, 1.0 };
GLfloat mat_ambient[] = { 0.7, 0.7, 0.7, 1.0 };
GLfloat mat_ambient_color[] = { 0.8, 0.8, 0.2, 1.0 };
GLfloat mat_diffuse[] = { 0.1, 0.5, 0.8, 1.0 };
//GLfloat mat_specular[] = { 1.0, 1.0, 1.0, 1.0 };
GLfloat no_shininess[] = { 0.0 };
GLfloat low_shininess[] = { 5.0 };
GLfloat high_shininess[] = { 100.0 };
GLfloat mat_emission[] = {0.3, 0.2, 0.2, 0.0};

GLfloat meta_specular[] = { 1.0, 1.0, 1.0, 0.0 };
GLfloat meta_shininess[] = { 50.0 };
GLfloat light_position_meta[] = { 1.0, 1.0, 1.0, 0.0 };

GLMmodel* pmodel = NULL;
GLMmodel* pmodel1 = NULL;
GLMmodel* pmodel2 = NULL;
GLMmodel* pmodel3 = NULL;
GLMmodel* pmodel4 = NULL;

static float door = 0.0;
static float teapotRotate=0.0;
static float zTranslate = 0.0,xTranslate=0.0,yTranslate=0.0;
static float xWall = 0.0,zWall=0.0;
float zRot = 0.0;
int flag = 0;

GLuint list1;   //for display list

#define flowers "C:/Users/Mego/Documents/CodeBlocks/Projects/task/task/models/flowers.obj"
#define vase "C:/Users/Mego/Documents/CodeBlocks/Projects/task/task/models/rose+vase.obj"
#define football_player "C:/Users/Mego/Documents/CodeBlocks/Projects/task/task/models/al.obj"
#define soccerball "C:/Users/Mego/Documents/CodeBlocks/Projects/task/task/models/soccerball.obj"

void crossProduct(GLfloat a[], GLfloat b[], GLfloat c[]){
	c[0] = a[1]*b[2] - a[2]*b[1];
	c[1] = a[2]*b[0] - a[0]*b[2];
	c[2] = a[0]*b[1] - a[1]*b[0];
}

void normalize(GLfloat a[]){
	double norm;
	norm = a[0]*a[0] + a[1]*a[1] + a[2]*a[2];
	norm = sqrt(norm);
	a[0] /= norm;
	a[1] /= norm;
	a[2] /= norm;
}

void rotatePoint(GLfloat a[], GLfloat theta, GLfloat p[]){

double temp[3];
temp[0] = p[0];
temp[1] = p[1];
temp[2] = p[2];

temp[0] = -a[2]*p[1] + a[1]*p[2];
temp[1] = a[2]*p[0] - a[0]*p[2];
temp[2] = -a[1]*p[0] + a[0]*p[1];

temp[0] *= sin(theta);
temp[1] *= sin(theta);
temp[2] *= sin(theta);

temp[0] += (1-cos(theta))*(a[0]*a[0]*p[0] + a[0]*a[1]*p[1] + a[0]*a[2]*p[2]);
temp[1] += (1-cos(theta))*(a[0]*a[1]*p[0] + a[1]*a[1]*p[1] + a[1]*a[2]*p[2]);
temp[2] += (1-cos(theta))*(a[0]*a[2]*p[0] + a[1]*a[2]*p[1] + a[2]*a[2]*p[2]);

temp[0] += cos(theta)*p[0];
temp[1] += cos(theta)*p[1];
temp[2] += cos(theta)*p[2];

p[0] = temp[0];
p[1] = temp[1];
p[2] = temp[2];

}

void Left(){
	double speed = 0.1;
	rotatePoint(up,speed,center);
	//rotatePoint(up, speed, light_position);
	//rotatePoint(up, speed, n);
	glutPostRedisplay();
}

void Right(){
	double speed = 0.1;
	rotatePoint(up,-speed,center);
	//rotatePoint(up, -speed, light_position);
	//rotatePoint(up, -speed, n);
	glutPostRedisplay();
}

void Up(){

	double speed = 0.1;
	if( yTranslate >= 4.5 ) return;
	yTranslate=1.0;
	center[1] += yTranslate*speed;
	yTranslate=center[1];
	printf("eye(x)= %0.1f\n", xTranslate);
					printf("eye(y)= %0.1f\n", yTranslate);
					printf("eye(z)= %0.1f\n", zTranslate);
					printf("_________________\n");
					printf("center[x]= %0.1f\n", center[0]);
					printf("center[y]= %0.1f\n", center[1]);
					printf("center[z]= %0.1f\n", center[2]);
					printf("_________________\n");
	glutPostRedisplay();

}

void Down(){
	double speed = -0.1;
	if( yTranslate <= -2.4 ) return;
	yTranslate=1.0;
	center[1] += yTranslate*speed;
	yTranslate=center[1];
	printf("eye(x)= %0.1f\n", xTranslate);
					printf("eye(y)= %0.1f\n", yTranslate);
					printf("eye(z)= %0.1f\n", zTranslate);
					printf("_________________\n");
					printf("center[x]= %0.1f\n", center[0]);
					printf("center[y]= %0.1f\n", center[1]);
					printf("center[z]= %0.1f\n", center[2]);
					printf("_________________\n");
	glutPostRedisplay();

}

void drawSpecialWall(){

	glBegin(GL_POLYGON);
	glNormal3f(1,2,1);
    glVertex3f(8.0f, 0.0f, 0.0f);
    glNormal3f(1,2,1);
    glVertex3f(8.0f, 3.0f, 0.0f);
    glNormal3f(1,2,1);
    glVertex3f(8.0f, 3.0f, 5.0f);
    glNormal3f(1,2,1);
    glVertex3f(8.0f, 0.0f, 5.0f);
	glEnd();

}

void wall(){

	glBegin(GL_QUADS);
    // front
     glNormal3f(1,1,1);
    //glColor4f(1.1, 0.1, 0.1, 1.0);
    glColor4f(0.1, 0.1, 0.3, 1.0);
    glVertex3f(0.0f, 0.0f, 0.0f);
    glVertex3f(3.0f, 0.0f, 0.0f);
    glVertex3f(3.0f, 3.0f, 0.0f);
    glVertex3f(0.0f, 3.0f, 0.0f);
    // back
    glNormal3f(1,1,1);
    //glColor4f(0.1, 0.1, 0.3, 1.0);
    glVertex3f(0.0f, 0.0f, 3.0f);
    glVertex3f(3.0f, 0.0f, 3.0f);
    glVertex3f(3.0f, 3.0f, 3.0f);
    glVertex3f(0.0f, 3.0f, 3.0f);
    // right
    glNormal3f(1,1,1);
    //glColor4f(0.3, 0.1, 0.1, 1.0);
    glVertex3f(3.0f, 0.0f, 0.0f);
    glVertex3f(3.0f, 3.0f, 0.0f);
    glVertex3f(3.0f, 3.0f, 3.0f);
    glVertex3f(3.0f, 0.0f, 3.0f);
    // left
    glNormal3f(1,1,1);
    //glColor4f(0.1, 0.6, 0.1, 1.0);
    glVertex3f(0.0f, 0.0f, 0.0f);
    glVertex3f(0.0f, 3.0f, 0.0f);
    glVertex3f(0.0f, 3.0f, 3.0f);
    glVertex3f(0.0f, 0.0f, 3.0f);
    // top
    glNormal3f(0,-1,0);
    glColor4f(0.8, 0.8, 0.8, 1.0);
    glVertex3f(0.0f, 3.0f, 0.0f);
    glVertex3f(3.0f, 3.0f, 0.0f);
    glVertex3f(3.0f, 3.0f, 3.0f);
    glVertex3f(0.0f, 3.0f, 3.0f);
    // bottom
    glNormal3f(0,1,0);
    glColor4f(0.1, 0.1, 0.1, 1.0);
    glVertex3f(0.0f, 0.0f, 0.0f);
    glVertex3f(3.0f, 0.0f, 0.0f);
    glVertex3f(3.0f, 0.0f, 3.0f);
    glVertex3f(0.0f, 0.0f, 3.0f);
    glEnd();
}

void drawCube(){

    glBegin(GL_QUADS);
    // front
     glNormal3f(-1,1,1);
    //glColor4f(1.1, 0.1, 0.1, 1.0);
    glColor4f(0.5, 0.5, 0.5, 1.0);
    glVertex3f(0.0f, 0.0f, 0.0f);
    glVertex3f(3.0f, 0.0f, 0.0f);
    glVertex3f(3.0f, 3.0f, 0.0f);
    glVertex3f(0.0f, 3.0f, 0.0f);
    // back
    glNormal3f(1,1,1);
    //glColor4f(0.1, 0.1, 0.3, 1.0);
    glVertex3f(0.0f, 0.0f, 3.0f);
    glVertex3f(3.0f, 0.0f, 3.0f);
    glVertex3f(3.0f, 3.0f, 3.0f);
    glVertex3f(0.0f, 3.0f, 3.0f);
    // right
    glNormal3f(1,1,-1);
    //glColor4f(0.3, 0.1, 0.1, 1.0);
    glVertex3f(3.0f, 0.0f, 0.0f);
    glVertex3f(3.0f, 3.0f, 0.0f);
    glVertex3f(3.0f, 3.0f, 3.0f);
    glVertex3f(3.0f, 0.0f, 3.0f);
    // left
    glNormal3f(1,1,1);
    //glColor4f(0.1, 0.6, 0.1, 1.0);
    glVertex3f(0.0f, 0.0f, 0.0f);
    glVertex3f(0.0f, 3.0f, 0.0f);
    glVertex3f(0.0f, 3.0f, 3.0f);
    glVertex3f(0.0f, 0.0f, 3.0f);
    // top
    glNormal3f(1,1,1);
    //glColor4f(0.1, 0.1, 0.1, 1.0);
    glVertex3f(0.0f, 3.0f, 0.0f);
    glVertex3f(3.0f, 3.0f, 0.0f);
    glVertex3f(3.0f, 3.0f, 3.0f);
    glVertex3f(0.0f, 3.0f, 3.0f);
    // bottom
    glNormal3f(1,-1,1);
    //glColor4f(0.1, 0.1, 0.1, 1.0);
    glVertex3f(0.0f, 0.0f, 0.0f);
    glVertex3f(3.0f, 0.0f, 0.0f);
    glVertex3f(3.0f, 0.0f, 3.0f);
    glVertex3f(0.0f, 0.0f, 3.0f);
    glEnd();

}

void displayList(){
    pmodel = glmReadOBJ(flowers);
	pmodel1 = glmReadOBJ(vase);
	pmodel2 = glmReadOBJ(soccerball);
	pmodel3 = glmReadOBJ(football_player);
	pmodel4 = glmReadOBJ(football_player);

	//import flower object.
    glPushMatrix();
    glmUnitize(pmodel);
    glmFacetNormals(pmodel);
    glmVertexNormals(pmodel, 30.0);
    glTranslatef(7,0.5,0.5);
    glmScale(pmodel,0.5);
    glmDraw(pmodel, GLM_SMOOTH | GLM_MATERIAL);
    glPopMatrix();

    //import rose+vase object.
    glPushMatrix();
    glmUnitize(pmodel1);
    glmFacetNormals(pmodel1);
    glmVertexNormals(pmodel1, 30.0);
    glTranslatef(5,0.5,0.5);
    glmScale(pmodel1,0.5);
    glmDraw(pmodel1, GLM_SMOOTH | GLM_MATERIAL);
    glPopMatrix();

    //import soccerball object.
    glPushMatrix();
    glmUnitize(pmodel2);
    glmFacetNormals(pmodel2);
    glmVertexNormals(pmodel2, 30.0);
    glTranslatef(5,0.2,7.25);
    glmScale(pmodel2,0.15);
    glmDraw(pmodel2, GLM_SMOOTH | GLM_MATERIAL);
    glPopMatrix();

    //import football player1 object.
    glPushMatrix();
    glmUnitize(pmodel3);
    glmFacetNormals(pmodel3);
    glmVertexNormals(pmodel3, 30.0);
    glTranslatef(4,0.5,7.25);
    glmScale(pmodel3,0.5);
    glRotatef(90,0,1,0);
    glmDraw(pmodel3, GLM_SMOOTH | GLM_MATERIAL);
    glPopMatrix();


    //import football player2 object.
    glPushMatrix();
    glmUnitize(pmodel4);
    glmFacetNormals(pmodel4);
    glmVertexNormals(pmodel4, 30.0);
    glTranslatef(6,0.5,7.25);
    glmScale(pmodel4,0.5);
    glRotatef(270,0,1,0);
    glmDraw(pmodel4, GLM_SMOOTH | GLM_MATERIAL);
    glPopMatrix();

}

void initRendering(){
	glutInitWindowSize(windowWidth,windowHeight);
	// Request Double and Depth buffers
	glutInitDisplayMode(GLUT_RGBA|GL_DOUBLE| GLUT_DEPTH);
	glutCreateWindow("LIGHTING TASK");
	// Enable Depth buffer
	glEnable(GL_DEPTH_TEST);
	// Enable Blending - Enable Alpha component
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT0);
    glEnable(GL_LIGHT1);
	GLfloat ambientColor[] = {1.0f, 1.0f, 1.0f, 1.0f}; //Color (0.2, 0.2, 0.2)
	glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambientColor);
	glEnable(GL_NORMALIZE);

	glLightfv(GL_LIGHT0, GL_AMBIENT, light_ambient);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, light_diffuse);
    glLightfv(GL_LIGHT0, GL_SPECULAR, light_specular);

	glLightfv(GL_LIGHT1, GL_AMBIENT, light_ambient);
    glLightfv(GL_LIGHT1, GL_DIFFUSE, light_diffuse);
    glLightfv(GL_LIGHT1, GL_SPECULAR, light_specular);

	glShadeModel(GL_SMOOTH);

	list1 = glGenLists (1);
    glNewList(list1, GL_COMPILE);
    displayList();
    glEndList();

}

void display(){

	glClearColor(0.0, 0.0, 0.0, 1.0);
	// Clear Depth and Color buffers
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glMatrixMode(GL_MODELVIEW);glNormal3f(-1,1,1);
	glLoadIdentity();
   //Add positioned light
	GLfloat lightColor0[] = {1.0f, 1.0f, 1.0f, 1.0f}; //Color
	GLfloat lightPos0[]= {5.0f, 3.0f, 8.0f, 0.0f};   //0.0f: w=0 -> infinite light source
	glLightfv(GL_LIGHT0, GL_COLOR, lightColor0);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, light_diffuse);
	glLightfv(GL_LIGHT0, GL_POSITION, lightPos0);

	//Add directed light
	GLfloat lightColor1[] = {5.0f, 5.0f, 5.0f, 1.0f}; //Color
	GLfloat lightPos1[] = {8.0f, 5.0f, 1.0f, 0.0f};  //0.0f: w=0 -> infinite light source
	glLightfv(GL_LIGHT1, GL_COLOR, lightColor1);
	glLightfv(GL_LIGHT1, GL_POSITION, lightPos1);
    gluLookAt(eye[0],eye[1],eye[2],center[0],center[1],center[2],up[0],up[1],up[2]);

    //call display list.
    glCallList(list1);

    ////draw the all axis
//    glPushMatrix();
//    glBegin(GL_LINES);
//    glColor4f(0,1,0,1);//x-axis
//    glVertex3f(100, 0,0);
//    glVertex3f(-100, 0, 0);
//    glColor4f(1, 0, 0, 1);//z-axis
//    glVertex3f(0, 0, 100);
//    glVertex3f(0, 0, -100);
//    glColor4f(0, 0, 1, 1);//y-axis
//    glVertex3f(0, 100, 0);
//    glVertex3f(0, -100, 0);
//    glEnd();
//    glPopMatrix();

	glPushMatrix();
	glEnable(GL_COLOR_MATERIAL);
    glPushMatrix();
    glTranslatef(8,0,5.50);
    glRotatef((GLfloat)door, 0.0, 1.0, 0.0);
    glTranslatef(-8,0,-5.50);
    glPushMatrix();
    glColor4f(0.1, 0.1, 0.3, 1.0);//door
    glTranslatef(0.0, 0.0,3.496);
    glScalef(1,0.60,0.40);
    drawSpecialWall();
    glPopMatrix();
    glPopMatrix();

    glPushMatrix();
    //glColor4f(0.5, 0.2, 0.1, 1.0);//blue

    glColor4f(0.1, 0.1, 0.3, 1.0);
    glTranslatef(0.0, 1.8,3.5);
    glScalef(1,0.4,0.4);
    drawSpecialWall();
    glPopMatrix();


    glPushMatrix();
    glColor4f(0.1, 0.1, 0.3, 1.0);
    glScalef(1,1,0.7);
    drawSpecialWall();
    glPopMatrix();

    glPushMatrix();
    glColor4f(0.1, 0.1, 0.3, 1.0);
    glTranslatef(0.0, 0.0,5.5);
    glScalef(1,1,0.7);
    drawSpecialWall();
    glPopMatrix();

    glPushMatrix();
	glColor4f(0.1, 0.1, 0.3, 1.0);
	glScalef(5,1,3);
	wall();
    glPopMatrix();

    //draw 1st teapot
    glPushMatrix();
    glTranslatef(12,0.85,3);
    glRotatef((GLfloat)teapotRotate, 0.0, 1.0, 0.0);
    glTranslatef(-12,-0.85,-3);
    glPushMatrix();
    //glShadeModel (GL_SMOOTH);
	glMaterialfv(GL_FRONT, GL_AMBIENT, no_mat);
	glMaterialfv(GL_FRONT, GL_DIFFUSE, mat_diffuse);
	glMaterialfv(GL_FRONT, GL_EMISSION, no_mat);
	glTranslatef(12,0.85,3);
	glutSolidTeapot(0.2);
	glPopMatrix();

    //draw 2nd teapot
    glPushMatrix();
    glShadeModel (GL_SMOOTH);
	glMaterialfv(GL_FRONT, GL_AMBIENT, no_mat);
	glMaterialfv(GL_FRONT, GL_DIFFUSE, mat_diffuse);
	glMaterialfv(GL_FRONT, GL_SPECULAR, mat_specular);
	glMaterialfv(GL_FRONT, GL_SHININESS, low_shininess);
	glMaterialfv(GL_FRONT, GL_EMISSION, no_mat);
	glTranslatef(12,0.85,4);
	glutSolidTeapot(0.2);
	glPopMatrix();

    //draw 3rd teapot
    glPushMatrix();
	glShadeModel (GL_SMOOTH);
    glMaterialfv(GL_FRONT, GL_SPECULAR, meta_specular);
    glMaterialfv(GL_FRONT, GL_SHININESS, meta_shininess);
    glLightfv(GL_LIGHT0, GL_POSITION, light_position_meta);
	glTranslatef(12,0.85,5);
	glutSolidTeapot(0.2);
    glPopMatrix();
	//glDisable(GL_SHADE_MODEL);
	glPopMatrix();

    glPushMatrix();
    glShadeModel(GL_SMOOTH);
    glColor4f(0.0, 0.1, 0.3, 1.0);
	glTranslatef(11,0.1,2);
	glScalef(0.6,0.2,1.5); // cube
	drawCube();
	glEnable(GL_SHADE_MODEL);
    glPopMatrix();

    glFlush();
	glutSwapBuffers();
}

void Timer(int x){

	if (door<=90 ){
			door += 1.0;
			glutPostRedisplay();
			glutTimerFunc(30, Timer, 0);
			if(door == 90) flag = 1;
		}
}

void Timerback(int x){

	if (door>=0 ){
		door -= 1.0;
		glutPostRedisplay();
		glutTimerFunc(30, Timerback, 0);
		if(door == 0) flag = 0;
	}
}

void teapotimer(int x){
    teapotRotate++;
    glutPostRedisplay();
    glutTimerFunc(30, teapotimer, 0);
}

void moveForward(){

	double speed = 0.05;
	if(center[0] <= -12 || center[0] >= 22)  speed = 0.006;
	if(center[2] <= -12 || center[2] >= 26)  speed = 0.004;

	xTranslate=1;
	yTranslate=1;
	zTranslate=1;

	xTranslate = center[0] - eye[0];
	yTranslate = center[1] - eye[1];
	zTranslate = center[2] - eye[2];

	eye[0] += xTranslate*speed;
	eye[1] += yTranslate*speed;
	eye[2] += zTranslate*speed;

	center[0] += xTranslate*speed;
	center[1] += yTranslate*speed;
	center[2] += zTranslate*speed;

	xTranslate = eye[0];
	yTranslate = eye[1];
	zTranslate = eye[2];

	glutPostRedisplay();

}

void moveBack(){

	double speed = -0.05;
	if(center[0] <= -12 || center[0] >= 22)  speed = -0.006;
	if(center[2] <= -12 || center[2] >= 26)  speed = -0.004;

	xTranslate=1;
	yTranslate=1;
	zTranslate=1;

	xTranslate = center[0] - eye[0];
	yTranslate = center[1] - eye[1];
	zTranslate = center[2] - eye[2];

	eye[0] += xTranslate*speed;
	eye[1] += yTranslate*speed;
	eye[2] += zTranslate*speed;

	center[0] += xTranslate*speed;
	center[1] += yTranslate*speed;
	center[2] += zTranslate*speed;

	xTranslate = eye[0];
	yTranslate = eye[1];
	zTranslate = eye[2];

	glutPostRedisplay();
}

void Keyboard(unsigned char Key, int x, int y){
	switch (Key)
	{
		case 'f':
			moveForward();
					printf("eye(x)= %0.1f\n", xTranslate);
					printf("eye(y)= %0.1f\n", yTranslate);
					printf("eye(z)= %0.1f\n", zTranslate);
					printf("_________________\n");
					printf("center[x]= %0.1f\n", center[0]);
					printf("center[y]= %0.1f\n", center[1]);
					printf("center[z]= %0.1f\n", center[2]);
					printf("_________________\n");
					break;
			break;
		case 'b':
			moveBack();
					printf("eye(x)= %0.1f\n", xTranslate);
					printf("eye(y)= %0.1f\n", yTranslate);
					printf("eye(z)= %0.1f\n", zTranslate);
					printf("_________________\n");
					printf("center[x]= %0.1f\n", center[0]);
					printf("center[y]= %0.1f\n", center[1]);
					printf("center[z]= %0.1f\n", center[2]);
					printf("_________________\n");
			break;
		case ' ':
			if(flag == 0) Timer(0);
			if(flag == 1) Timerback(0);
			break;

		default:
			break;
	}
}

void specialKeys(int key, int x, int y){
	switch( key )
	{
		case GLUT_KEY_LEFT  : Left(); break;
        case GLUT_KEY_RIGHT : Right() ; break;
        case GLUT_KEY_UP :    Up() ; break;
        case GLUT_KEY_DOWN :  Down() ; break;
	}

}

int main(int argc, char** argv) {

    glutInit(&argc, argv);
    initRendering();
	glMatrixMode(GL_PROJECTION);
	gluPerspective(60,aspect,0.1,30);
    glClearColor(0.0,0.0,0.0,0.0);
	glutDisplayFunc(display);
	glutKeyboardFunc(Keyboard);
	glutSpecialFunc(specialKeys);
	teapotimer(0);
	glutMainLoop();
	return 0;
}

