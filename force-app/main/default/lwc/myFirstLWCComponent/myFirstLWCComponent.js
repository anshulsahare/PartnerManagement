import { LightningElement } from 'lwc';

export default class MyFirstLWCComponent extends LightningElement {
name;
firstName='avinash';
lastName='Sahare';
phone=9370127688;
salary=70000.22;
flag = true;
todayDate= new Date();

objAcc = {'sObjectType' : 'Account'}//object
objApplicant = {'sObjectType':'Applicant__c'}

objContact = { //another way of creating object of default values
'firstName':'Anshul',
'lastName':'Sahare',
'email':'sahareanshul17@gmail.com'
}

empList=['akshu','vihan','ranitai','golu'];

display(){

}
myMethod(){

}
}