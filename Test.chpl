//This adds the required files needed to compile the program
require "gtk/gtk.h", "gtk_gui.c", "gtk_gui.h";

//This extends the GtkWidget type into chapel
extern type GtkWidget;

//This function initialises gtk components(gives them their default value) before their us
extern proc chpl_init(ref argc: c_int, argv: c_string) : void;

//This function returns a window with title = title( the first argument) and of width and hiegth the second
// and third arguments respectively
extern proc chpl_window_new( title: c_string,  width: c_int, height: c_int) : c_ptr(GtkWidget);

//This function sets the visibility of a widget to true
extern proc chpl_show_widget( object: c_ptr(GtkWidget)): void;

//This function sets the visibility of all widgets in a container to true
extern proc chpl_show_all_widget( object: c_ptr(GtkWidget)): void;

//This function calls indicates the end of the program
extern proc chpl_main(): void;

//This function terminates a window
extern proc chpl_main_quit(): void;

//Beginning of main
proc main( args: [] string){

  var a: c_int = 1;
  var str: c_string = "Test";

  chpl_init( a, str);

  var window: c_ptr(GtkWidget) = chpl_window_new("Testing chapel it works", 400, 400);
  chpl_show_widget(window);

  chpl_main();
}

