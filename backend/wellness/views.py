from django.shortcuts import render
from wellness.models import Hospital

def hospital_detail(request, pk):
    
    hospital_obj = Hospital.objects.get(pk=pk)
    
    context = {
        "hospitals": hospital_obj
    }
    
    return render(request, "hospital_detail.html", context)