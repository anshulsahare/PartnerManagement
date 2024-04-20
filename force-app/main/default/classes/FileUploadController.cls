public with sharing class FileUploadController {
    @AuraEnabled
    public static Id uploadFile(Id parentId, String fileName, Blob file) {
        Attachment attachment = new Attachment();
        attachment.ParentId = parentId;
        attachment.Name = fileName;
        attachment.Body = file;
        insert attachment;
        return attachment.Id;
    }

    @AuraEnabled
    public static String getFileDownloadLink(Id recordId) {
        List<Attachment> attachments = [SELECT Id FROM Attachment WHERE ParentId = :recordId ORDER BY CreatedDate DESC LIMIT 1];
        if (!attachments.isEmpty()) {
            String fileId = attachments[0].Id;
            return '/servlet/servlet.FileDownload?file=' + fileId;
        }
        return null;
    }
}