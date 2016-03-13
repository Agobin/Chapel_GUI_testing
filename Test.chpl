//This adds the required files needed to compile the program
require "gtk/gtk.h", "gtk_gui.c", "gtk_gui.h";

//This extends the GtkWidget and GtkContainer types into chapel
extern type GtkWidget;
extern type GtkContainer;

//This function initialises gtk components(gives them their default value) before their us
extern proc chpl_init(ref argc: c_int, ref argv: c_string) : void;

//This function returns a window with title = title( the first argument) and of width and hiegth the second
// and third arguments respectively
extern proc chpl_window_new( title: c_string,  width: c_int, height: c_int) : c_ptr(GtkWidget);

//This function sets the visibility of a widget to true
extern proc chpl_show_widget( ref object: GtkWidget): void;

//This function sets the visibility of all widgets in a container to true
extern proc chpl_show_all_widget( object: c_ptr(GtkWidget)): void;

//This function calls indicates the end of the program
extern proc chpl_main(): void;

//This function terminates a window
extern proc chpl_main_quit(): void;

//This function returns a label widget
extern proc gtk_label_new( str: c_string): c_ptr(GtkWidget);

//This function casts a GtkWidget to a GtkContainer
extern proc GTK_CONTAINER( a: c_ptr(GtkWidget)) : c_ptr(GtkContainer);

//This function adds a widget into a container
extern proc gtk_container_add( wid: c_ptr(GtkContainer), child: c_ptr(GtkWidget));

//This function links a widget to a callback function
extern proc link_close_signal( window: c_ptr(GtkWidget)) :void;

//This function shows a dialog
proc showDialog( title: c_string, message: c_string, wid: c_int = 50, h: c_int = 30){
  var window: c_ptr(GtkWidget);
  var lab: c_ptr(GtkWidget);

  lab = gtk_label_new(message);
  window = chpl_window_new(title, wid, h);
  gtk_container_add(GTK_CONTAINER(window), lab);
  link_close_signal(window);
  chpl_show_all_widget(window);
}

//Beginning of main
proc main( args: [] string){

  var a: c_int = 1;
  var c_arg: c_string = args[0].c_str();
  var title: c_string = "This is the title of the window";
  var label_text: c_string = "This is a label";

  chpl_init( a, c_arg );
  showDialog(title, label_text, 500, 300);

  chpl_main();
}

