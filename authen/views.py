from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from authen.forms import SignUpForm
from django.http import JsonResponse
# Create your views here.


def health_check(request):
    return JsonResponse({"status": "ok"})

def readiness_check(request):
    return JsonResponse({"status": "ok"})


def home(request):
    return  render(request, 'auth/home.html')

def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.save()
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=user.username, password=raw_password)
            login(request, user)
            return redirect('home')
    else:
        form = SignUpForm()
    return render(request, 'auth/signup.html', { 'form' : form })

# In your views.py

