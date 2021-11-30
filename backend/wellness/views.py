from django.forms.widgets import TimeInput
from django.shortcuts import render, redirect
from wellness.forms import HospitalForm  
from wellness.models import Hospital

def hospital(request):  
    if request.method == "POST":  
        form = HospitalForm(request.POST)  
        if form.is_valid():  
            try:  
                form.save()  
                return redirect('/main')  
            except:  
                pass  
    else:  
        form = HospitalForm()  
    return render(request,'index.html',{'form':form})  
def show(request):  
    hospitals = Hospital.objects.all().order_by('id')
    return render(request,"main.html",{'hospitals':hospitals})  
def edit(request, id):  
    hospital = Hospital.objects.get(id=id)  
    return render(request,'edit.html', {'hospital':hospital})  
def update(request, id):  
    hospital = Hospital.objects.get(id=id)  
    form = HospitalForm(request.POST, instance = hospital)  
    print(form)
    if form.is_valid():  
        form.save()  
        return redirect("/main") 
    return render(request, 'edit.html', {'hospital': hospital})  
def destroy(request, id):  
    hospital = Hospital.objects.get(id=id)  
    hospital.delete()  
    return redirect("/main")  