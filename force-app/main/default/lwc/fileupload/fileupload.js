import { LightningElement, track, api } from 'lwc';
import fetchFiles from '@salesforce/apex/Fileuploadcttrl.fetchFiles';
export default class Fileupload extends LightningElement {
    @api recordId;
    @track lstAllFiles;
    @track error;
    get acceptedFormats() {
        return ['.pdf', '.png', '.jpg'];
    }

    handleUploadFinished(event) {
        this.connectedCallback();
    }

    connectedCallback() {
        fetchFiles({ recordId: this.recordId })
            .then((result) => {
                this.lstAllFiles = result;
                this.error = undefined;
            })
            .catch((error) => {
                this.lstAllFiles = undefined;
                this.error = error;
            });
    }

    get showFiles() {
        return this.lstAllFiles && this.lstAllFiles.length > 0;
    }
}