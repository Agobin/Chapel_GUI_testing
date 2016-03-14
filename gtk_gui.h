#ifndef _GTK_GUI_H
#define _GTK_GUI_H

#include <gtk/gtk.h>
#include "gtk_gui.h"

//This function interfaces gtk_init() in chapel. It initialises gtk components to their default value
extern void chpl_init(int *argc, const char **argv);

//This functions declares a window, intilises it and then return it.
extern GtkWidget* chpl_window_new( const char * title, int width, int height);

extern void link_close_signal(GtkWidget **window);

#endif
