from django import forms  
from wellness.models import Hospital

class HospitalForm(forms.ModelForm):
    class Meta:
        model = Hospital 
        fields = "__all__"