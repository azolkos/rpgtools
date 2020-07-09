from django import forms

class NpcSheet(forms.Form):
    handle = forms.CharField(label='Handle', max_length=100)
