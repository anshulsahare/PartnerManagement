@isTest
public class CalulationssTestClass {

    @isTest
    public static void SubtractTestClass(){
        calculationss obj = new calculationss();
        decimal totalbro =obj.subtract(10.10, 20.2);
        system.assertEquals(-10.1, totalbro);
    }
    @isTest
    Public static void MultiplyTestClass(){
        integer totalMulti =calculationss.multiply(10,5);
        system.assertEquals(50, totalMulti);
    }
    @isTest
    public static void ConcateTestClass(){
        string ConCateName = calculationss.concate('ANSHUL', 'sahare');
        system.assertEquals('ANSHUL sahare', ConCateName);
    }
    
}