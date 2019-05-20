class PatientsController < ApplicationController
    def index
        @patients = Patient.all; #[{first_name:"Lamar", ....}]
    end

    def show
        @Patient = Patient.find(params[:id])
    end

    def destroy
        @Patient = Patient.find(params[:id])
        @Patient.destroy
    
        redirect_to patients_path
    end

    def new
        @Patient= Patient.new
    end

    def create
        @Patient = Patient.create(book_params)
        #redirect_to patients_path
        redirect_to patients_path(@patient)
    end

    def edit
        @Patient = Patient.find(params[:id])
    end

    def update
        @Patient = Patient.find(params[:id])
        @Patient.update(book_params)
        #redirect_to patients_path
        redirect_to patient_path(@patient)
    end

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :diagnosis, :born_on)
    end



end