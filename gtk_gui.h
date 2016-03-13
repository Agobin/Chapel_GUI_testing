#ifndef _GTK_GUI_H
#define _GTK_GUI_H

#include <gtk/gtk.h>
#include "gtk_gui.h"

//This function interfaces gtk_init() in chapel. It initialises gtk components to their default value
 extern void chpl_init(int *argc, const char **argv);

//This functions declares a window, intilises it and then return it.
 extern GtkWidget* chpl_window_new( const char * title, int width, int height);

//This function sets the visibility of a widget to true
 extern void chpl_show_widget(GtkWidget *object);

//This function sets the visibility of all widgets in a container to true
 extern void chpl_show_all_widget(GtkWidget *object);

//This function calls gtk_main() which indicates the end of run of a gtk program
 extern void chpl_main();

//This function closes a window when its destroy signal is emitted
 extern void chpl_main_quit();

 extern void link_close_signal(GtkWidget *window);

#endif
