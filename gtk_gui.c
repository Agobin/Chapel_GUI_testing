//Including the gtk/gtk.h library
#include <gtk/gtk.h>
#include "gtk_gui.h"

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

//This function sets the visibility of a widget to true
void chpl_show_widget(GtkWidget *object){
	gtk_widget_show(object);
}

//This function sets the visibility of all widgets in a container to true
void chpl_show_all_widget(GtkWidget *object){
	gtk_widget_show_all(object);
}

//This function calls gtk_main() which indicates the end of run of a gtk program
void chpl_main(){
	gtk_main();
}

//This function closes a window when its destroy signal is emitted
void chpl_main_quit(){
	gtk_main_quit();
}

void link_close_signal(GtkWidget *window){
   g_signal_connect(window, "destroy", G_CALLBACK(gtk_widget_destroy), window);
}
