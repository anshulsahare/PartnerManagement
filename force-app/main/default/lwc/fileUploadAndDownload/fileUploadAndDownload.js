import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import uploadFile from '@salesforce/apex/FileUploadController.uploadFile';
import getFileDownloadLink from '@salesforce/apex/FileUploadController.getFileDownloadLink';

export default class FileUploadAndDownload extends LightningElement {
    @track isUploading = false;
    @track fileUploaded = false;
    @track fileDownloadLink;
    @track fileDownloadName;

    handleFileChange(event) {
        this.selectedFile = event.target.files[0];
    }

    handleFileUpload() {
        if (!this.selectedFile) return;

        this.isUploading = true;

        // Set the related record Id where you want to attach the file.
        const recordId = '<your_related_record_id_here>';

        const formData = new FormData();
        formData.append('parentId', recordId);
        formData.append('file', this.selectedFile);

        uploadFile({ formData })
            .then(result => {
                this.isUploading = false;
                this.fileUploaded = true;
                this.getFileDownloadLink(recordId);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'File uploaded successfully.',
                        variant: 'success'
                    })
                );
            })
            .catch(error => {
                this.isUploading = false;
                console.error('Error uploading file:', error);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: 'Error uploading file.',
                        variant: 'error'
                    })
                );
            });
    }

    getFileDownloadLink(recordId) {
        getFileDownloadLink({ recordId })
            .then(result => {
                this.fileDownloadLink = result;
                this.fileDownloadName = this.selectedFile.name;
            })
            .catch(error => {
                console.error('Error fetching download link:', error);
            });
    }
}