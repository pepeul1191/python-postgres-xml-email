from telnetlib import EC
from tkinter import Button
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import time, os
#import pandas as pd

options = webdriver.ChromeOptions()
options.add_argument('--start-maximized')
options.add_argument('--disable-extensions')

driver_path = '/usr/lib/chromium-browser/chromedriver'
driver = webdriver.Chrome(driver_path, chrome_options=options)

def youtube():
  # load page
  driver.set_window_position(100,0)
  time.sleep(1)
  driver.get('https://www.youtube.com/watch?v=0AvX54Rp4sc')
  # input
  WebDriverWait(driver, 5)\
    .until(EC.element_to_be_clickable((By.CSS_SELECTOR, 'input#search')))\
    .send_keys('Carlos Tevez')
  WebDriverWait(driver, 5)\
    .until(EC.element_to_be_clickable((By.CSS_SELECTOR, 'input#search')))\
    .send_keys(Keys.ENTER)

# load page
driver.set_window_position(50,0)
time.sleep(1)
driver.get('http://localhost:8080')
# get files
dir_list = os.listdir(os.getcwd()+"/tmp/1660172045")
for file in dir_list:
  ul = driver.find_element(By.ID, 'nav')
  # /home [GET]
  lis = ul.find_elements(By.TAG_NAME, 'li')
  lis[1].click()
  # /form [GET]
  file_dir = os.getcwd()+"/tmp/1660172045/"+file
  WebDriverWait(driver, 5)\
    .until(EC.element_to_be_clickable((By.CSS_SELECTOR, 'input#file')))\
    .send_keys(file_dir)
  form = driver.find_element(By.TAG_NAME, 'form')
  divs = form.find_elements(By.TAG_NAME, 'div')
  divs[1].find_element(By.TAG_NAME, 'button').click()
  # /form [POST]
  WebDriverWait(driver, 15)\
    .until(EC.element_to_be_clickable((By.CSS_SELECTOR, 'a#goHome')))\
    .click()