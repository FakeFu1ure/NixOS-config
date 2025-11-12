#!/usr/bin/env python3

import random
import subprocess
from bs4 import BeautifulSoup
import requests
import os

WIDTH = 1920
HEIGHT = 1080

def change_colors(image_path):
    try:
        subprocess.run([
            'matugen', 'image', image_path
        ], check=True)
        subprocess.run(['pkill', '-USR2', 'waybar'], capture_output=True)
        subprocess.run(['makoctl', 'reload'], capture_output=True)
    except Exception as e:
        print(f"Color change failed: {e}")

def change_wallpaper(image_path):
    change_colors(image_path)
    
    rand_x = random.randint(0, WIDTH)
    rand_y = random.randint(0, HEIGHT)
    
    subprocess.run([
        'swww', 'img', image_path,
        '--transition-fps', '150',
        '--transition-step', '255', 
        '--transition-type', 'grow',
        '--transition-pos', f'{rand_x},{rand_y}',
        '--transition-duration', '2'
    ], check=True)

random_page = random.randint(1, 400)

response = requests.get(f'https://yande.re/post?page={random_page}&tags=wallpaper', timeout=10)
soup = BeautifulSoup(response.content, "lxml")
posts = soup.find_all('a', class_='thumb')

post = random.choice(posts)
post_url = f"https://yande.re{post['href']}"

post_response = requests.get(post_url, timeout=10)
post_soup = BeautifulSoup(post_response.content, "lxml")

image_url = None
for link in post_soup.find_all('a', href=True):
    href = link['href']
    if 'files.yande.re/image/' in href and 'sample' not in href:
        image_url = href
        break

if not image_url:
    download = post_soup.find('a', class_='download')
    if download and download.get('href'):
        image_url = download['href']

if image_url.startswith('//'):
    image_url = 'https:' + image_url
elif image_url.startswith('/'):
    image_url = 'https://yande.re' + image_url

image_data = requests.get(image_url, timeout=30).content

ext = 'jpg'
for extension in ['.png', '.gif', '.webp']:
    if extension in image_url.lower():
        ext = extension[1:]
        break

filename = f'wallpaper.{ext}'
with open(filename, 'wb') as f:
    f.write(image_data)

change_wallpaper(filename)
