
import paho.mqtt.client as mqtt , os, urlparse
import time
import json
import pygame
import pygame.camera
import base64
import math
import pymongo
import mimetypes
import requests
from pymongo import MongoClient
from gridfs import GridFS


user = "admin"
psw = "wK8RXwyxKyB6"
host = "127.12.96.130"
puerto = "27017"
bdnombre = "cloudcamraspi2"

def get_db():
    client = MongoClient("mongodb://"+user+":"+psw+"@" +host + ":" + puerto)
    db = client[bdnombre]
    return db


def insert_image(image_encoded,nombre):
    bd = get_db()
    coll = bd.CAPTURAS_STORE
    result = coll.insert_one({'nombre':nombre})
        

# definicion de callbacks
    
def on_connect(mosq, obj, rc):
    print("Conectado")
    print("" )

def on_message(mosq, obj, msg):
    print ("on_message:: this means  I got a message from brokerfor this topic")
    #print(msg.topic + " " + str(msg.qos) + " " + str(msg.payload))
    datos = msg.payload
    print ("")

def on_publish(mosq, obj, mid):
    #print("mid: " + str(mid))
    print ("")

def on_subscribe(mosq, obj, mid, granted_qos):
    print("This means broker has acknowledged my subscribe request")
    print("Subscribed: " + str(mid) + " " + str(granted_qos))

def on_log(mosq, obj, level, string):
    print(  string)

client = mqtt.Client()
# asignacion de callbacks
client.on_message = on_message
client.on_connect = on_connect
client.on_publish = on_publish
client.on_subscribe = on_subscribe

# Uncomment to enable debug messages
client.on_log = on_log

# usuario y pass
client.username_pw_set("raspi", "raspi")

client.connect('m13.cloudmqtt.com', 18381, 60)

client.loop_start()
#suscribirse al topic 'testeo' 
client.subscribe ("testeo" ,0 )

#inicialziacion de camara
pygame.camera.init()
pygame.camera.list_cameras()
cam = pygame.camera.Camera("/dev/video0",(640,480))
cam.start()

run = True
count = 1

while run:
    img = cam.get_image()
    url = "captura.jpg"
    pygame.image.save(img, url)
    fecha = time.strftime("%d-%m-%Y")
    hora = time.strftime("%X")
    tiempoCaptura = fecha + " " + hora 
    with open(url, "rb") as image_file:    
        imageByte = image_file.read()        
        imgEncoded = base64.b64encode(imageByte)
    
    data = {'id':count,'type':1,'detail':tiempoCaptura,'value':imgEncoded}
    jmsg = json.dumps(data)
    client.publish( "testeo",jmsg)
    
    #insert_image(imgEncoded,tiempoCaptura)
    
    time.sleep(30)
    count=count+1





        

