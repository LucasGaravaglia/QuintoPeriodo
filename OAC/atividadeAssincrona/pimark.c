#include <stdio.h>

void myadd(float *sum, float *addend);

int main(int argc, char *argv[]) {
   float ztot, yran, ymult, ymod, x, y, z, pi, prod;
   long int low, ixran, itot, j, iprod;

      printf("Pressione Enter para inciar.\n");
      scanf("%*c");

      printf("Calculating PI...\n");

      ztot = 0.0;
      low = 1;
      ixran = 1907;
      yran = 5813.0;
      ymult = 1307.0;
      ymod = 5471.0;
      itot = 1200000000;

      for(j=1; j<=itot; j++) {

        iprod = 27611 * ixran;
        ixran = iprod - 74383*(long int)(iprod/74383);
        x = (float)ixran / 74383.0;
        prod = ymult * yran;
        yran = (prod - ymod*(long int)(prod/ymod));
        y = yran / ymod;
        z = x*x + y*y;
        myadd(&ztot,&z);
        if ( z <= 1.0 ) {
          low = low + 1;
        }
      }
      printf("x = %8.5f y = %.5f low = %7d j=%7d\n",x , y, low, j);
      pi = 4.0 * (float)low/(float)itot;
      printf("Pi = %.8f ztot = %.2f itot = %d\n", pi, ztot, itot);

      return 0;
}

void myadd(float *sum, float *addend) {
      *sum = *sum + *addend;
}