require "gtk/gtk.h";

extern type GtkWidget;

proc getArraySize( argv: [] string ): int{
  var counter:int = 0;
  for a in argv{
    counter += 1;
  }
  return counter;
}

//prototype of gtk_init in c: gtk_init(int    *argc, char ***argv);
extern proc gtk_init( ref argc: c_int, ref argv: [] c_string );
extern proc gtk_widget_show_all(ref wid: GtkWidget);

proc main( args: [] string){

  var a = getArraySize(args);
//  gtk_init(a, args);
  writeln("Number of command line args is ", a);

}
