from django.urls import path
from wellness import views

urlpatterns = [
    path('hospital', views.hospital),  
    path('show',views.show),  
    path('edit/<int:id>', views.edit),  
    path('update/<int:id>', views.update),  
    path('delete/<int:id>', views.destroy),  
]