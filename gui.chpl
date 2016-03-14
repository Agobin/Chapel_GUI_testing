//This adds the required files needed to compile the program
require "gtk/gtk.h", "gtk_gui.c", "gtk_gui.h";


//The following lines of code until the next section involve externsion of types and functions already
// defined in c


//This extends the GtkWidget and GtkContainer types into chapel
extern type GtkWidget;
extern type GtkContainer;

//This function initialises gtk components(gives them their default value) before their us
extern proc chpl_init(ref argc: c_int, ref argv: c_string) : void;

//This function returns a window with title = title( the first argument) and of width and hiegth the second
// and third arguments respectively
extern proc chpl_window_new( title: c_string,  width: c_int, height: c_int) : c_ptr(GtkWidget);

//This function sets the visibility of a widget to true
extern proc gtk_widget_show( ref object: GtkWidget): void;

//This function sets the visibility of all widgets in a container to true
extern proc gtk_widget_show_all( object: c_ptr(GtkWidget)): void;

//This function calls indicates the end of the program
extern proc gtk_main(): void;

//This function returns a label widget
extern proc gtk_label_new( str: c_string): c_ptr(GtkWidget);

//This function casts a GtkWidget to a GtkContainer
extern proc GTK_CONTAINER( a: c_ptr(GtkWidget)) : c_ptr(GtkContainer);

//This function adds a widget into a container
extern proc gtk_container_add( wid: c_ptr(GtkContainer), child: c_ptr(GtkWidget));

//This function links a widget to a callback function
extern proc link_close_signal(ref window: c_ptr(GtkWidget)) :void;


//This section downwards involves definition of new functions


//This function shows a dialog
proc showDialog( title: c_string, message: c_string, wid: c_int = 50, h: c_int = 30){
  var window: c_ptr(GtkWidget);
  var lab: c_ptr(GtkWidget);

  lab = gtk_label_new(message);
  window = chpl_window_new(title, wid, h);
  gtk_container_add(GTK_CONTAINER(window), lab);
  link_close_signal(window);
  gtk_widget_show_all(window);
}

//This function initialises gtk components
proc initialise(args: [] string): void{
  var argc: c_int = 1;
  var cStr: c_string = args[0];
  chpl_init(argc, cStr);
}
