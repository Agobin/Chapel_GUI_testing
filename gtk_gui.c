//Including the gtk/gtk.h library
#include <gtk/gtk.h>
#include "gtk_gui.h"

//This function enables the destruction of a widget upon emission of a destroy signal
static void destroy( GtkWidget * window , gpointer data){
	gtk_main_quit();
}

//This function enables the destruction of a widget upon emission of a destroy event
static gboolean delete_event( GtkWidget *window, GdkEvent *event, gpointer data){
	return FALSE;
}

//This function interfaces gtk_init() in chapel. It initialises gtk components to their default value
void chpl_init(int *argc, const char **argv){

	gtk_init(argc, (char ***) &argv);
}

//This functions declares a window, intilises it and then return it.
GtkWidget * chpl_window_new( const char * title, int width, int height){
	GtkWidget *window;

	window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
	gtk_widget_set_size_request(window, width, height);
	gtk_window_set_title(GTK_WINDOW(window), (char *)title);

	return window;
}

void link_close_signal(GtkWidget **window){

  g_signal_connect( G_OBJECT(*window), "destroy", G_CALLBACK(destroy), NULL);
  g_signal_connect( G_OBJECT(*window), "delete_event", G_CALLBACK(delete_event), NULL);
}

void link_hide_signal(GtkWidget **window){
  gtk_widget_hide(*window);
}
