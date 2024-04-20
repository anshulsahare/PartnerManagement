public class opportunityInputClass {
    public Opportunity Opportunityyy { get; set; }

    public opportunityInputClass() {
        // Assign the newly created Opportunity object to the class-level property
        Opportunityyy = new Opportunity();
    }

    public PageReference Savereords() {
        // Now, Opportunityyy is properly initialized
        insert Opportunityyy;
        PageReference pr = Page.thankyoupage; // Use PageReference for page navigation
        pr.setRedirect(true); // Ensure the redirection
        return pr;
    }
}