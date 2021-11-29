from django.urls import path

from . import views

urlpatterns = [

    path("<int:pk>/", views.hospital_detail, name="hospital_detail"),

]