use gtk;

//Beginning of main
proc main( args: [] string){

  var title: c_string = "This is the title of the window";
  var label_text: c_string = "This is a label";

  gtk_init(args);
  showDialog(title, label_text, 500, 300);

  gtk_main();
}
 
