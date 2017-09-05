# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from .models import Proponente

from django.contrib import admin

class ProponenteAdmin(admin.ModelAdmin):

    database = 'salicweb'
    
    fields = ('cpf', 'nome', 'dtnascimento', 'email')

    def get_queryset(self, request):
        return super(ProponenteAdmin, self).get_queryset(request).using(self.database)

    def save_model(self, request, obj, form, change):
        obj.save(using=self.database)

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self,request,obj=None):
        return False

admin.site.register(Proponente, ProponenteAdmin)
