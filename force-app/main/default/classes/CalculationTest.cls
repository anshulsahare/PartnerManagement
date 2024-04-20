@isTest
public class CalculationTest {
   
    @isTest
    public static void additionMethod(){
        integer TotalSum = calculation.display(10,20); //code coverage
        
        system.assertEquals(30, TotalSum);
    }
}