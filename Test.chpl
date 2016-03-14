use gtk;

//Beginning of main
proc main( args: [] string){

  var title_w: c_string = "This is the title of the window";
  var title_d: c_string = "This is the title of the dialog";
  var label_text: c_string = "This is a label";

  gtk_init(args);

  var window: c_ptr(GtkWidget) = chpl_window_new(title_w, 500, 500);
  link_close_signal(window);
  gtk_widget_show(window);
  showDialog(title_d, label_text, 500, 300);

  gtk_main();
}
   
