public class child extends parent {

  
    public void callme()
    {
     super.display();
     system.debug('im fro call me method of child ');
    }
    
    public override void display()
    {system.debug('im from child ');}
        
}