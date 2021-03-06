# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from .models import Proponente
from django.contrib.auth.models import Group 
from django.contrib.auth.models import User 

from django.contrib import admin

class ProponenteAdmin(admin.ModelAdmin):

    admin.site.disable_action('delete_selected')
    
    admin.site.unregister(Group)
    admin.site.unregister(User)

    database = 'salicweb'
    
    fields = ('cpf', 'nome', 'dtnascimento', 'email')
    
    search_fields = ('cpf','nome','email')

    def get_queryset(self, request):
        return super(ProponenteAdmin, self).get_queryset(request).using(self.database)

    def save_model(self, request, obj, form, change):
        obj.save(using=self.database)

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self,request,obj=None):
        return False

admin.site.register(Proponente, ProponenteAdmin)
