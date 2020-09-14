# draw.py
# python script for drawing a line network
# author: Niels Lindner

# --- FILES ---

stations_file = "stations.csv"
lines_file = "lines-2020.csv"
od_file = "od.csv"

output_file = ""        # "" for output in window, otherwise filename with suitable extension, e.g., "output.png"

# --- IMPORTS ---

import csv
import math
import matplotlib.pyplot as plt
import networkx as nx

# --- DEFINITIIONS ---

class LineNetwork(nx.Graph):
    
    def __init__(self):
        super(LineNetwork, self).__init__()
        self.lines = {}
        
    def add_node(self, node, x, y, **attr):
        super(LineNetwork, self).add_node(node, **attr)
        self.nodes[node]["x"] = x
        self.nodes[node]["y"] = y
        
    def add_line(self, name, color, nodelist):
        self.lines[name] = {}
        self.lines[name]["color"] = color
        self.lines[name]["nodes"] = nodelist[:]
        for i in range(len(nodelist) - 1):
            self.add_edge(nodelist[i], nodelist[i+1])
            
    def draw(self, filename="", figwidth=20.0, linespread=4, linewidth=3, nodesize=400, nodebordersize=2, fontsize=10):
        xmin = min([self.nodes[v]["x"] for v in self.nodes])
        xmax = max([self.nodes[v]["x"] for v in self.nodes])
        ymin = min([self.nodes[v]["y"] for v in self.nodes])
        ymax = max([self.nodes[v]["y"] for v in self.nodes])
        width = max(xmax - xmin, 1)
        height = max(ymax - ymin, 1)
        ratio = height*1.0/width
        
        for (v, w) in self.edges():
            self[v][w]["lines"] = []
        
        for line in self.lines:
            for i in range(len(self.lines[line]["nodes"]) - 1):
                self[self.lines[line]["nodes"][i]][self.lines[line]["nodes"][i+1]]["lines"].append(line)          
        
        drawing_graph = nx.Graph()
        for (v, w) in self.edges:
            dx = self.nodes[w]["x"] - self.nodes[v]["x"]
            dy = self.nodes[w]["y"] - self.nodes[v]["y"]
            norm = math.sqrt(dx*dx + dy*dy)
            angle = math.atan2(dy, dx)
            lines = sorted(self[v][w]["lines"], reverse = (angle < 0))
            for i in range(len(lines)):
                drawing_graph.add_edge((v, w, i), (w, v, i), color = self.lines[lines[i]]["color"])
                r = i - (len(lines) - 1.0) / 2.0
                ox = dy * r * linespread / norm
                oy = - dx * r * linespread / norm
                drawing_graph.nodes[(v, w, i)]["coords"] = (self.nodes[v]["x"] + ox, self.nodes[v]["y"] + oy)
                drawing_graph.nodes[(w, v, i)]["coords"] = (self.nodes[w]["x"] + ox, self.nodes[w]["y"] + oy)
                
        for v in self.nodes:
            drawing_graph.add_node(v, coords = (self.nodes[v]["x"], self.nodes[v]["y"]))
                
        fig = plt.figure(figsize = (figwidth, figwidth*ratio))
        nx.draw_networkx(drawing_graph, pos = {v: drawing_graph.nodes[v]["coords"] for v in drawing_graph.nodes}, node_size = 0, linewidths = 0, edge_color = [d["color"] for (v, w, d) in drawing_graph.edges(data=True)], with_labels = False, width = linewidth)
        nx.draw_networkx_nodes(drawing_graph, pos = {v: drawing_graph.nodes[v]["coords"] for v in self.nodes}, nodelist = list(self.nodes), node_color = "#ffffff", node_size = nodesize, linewidths = nodebordersize, edgecolors = "#000000")
        nx.draw_networkx_labels(drawing_graph, pos = {v: drawing_graph.nodes[v]["coords"] for v in self.nodes}, labels = {v: v for v in self.nodes}, font_size = fontsize)
        plt.xlim(xmin - 0.02 * width, xmax + 0.02 * width)
        plt.ylim(ymin - 0.02 * height, ymax + 0.02 * height)
        plt.axis("off")
        plt.axis("equal")
        plt.draw()
        if filename != "":
            plt.savefig(filename, bbox_inches="tight", dpi="figure")    
        else:
            plt.show()
        plt.close()
        
    def read_stations(self, stations_file):
        with open(stations_file, "r") as f:
            reader = csv.DictReader(f, delimiter=";")
            for row in reader:
                self.add_node(row["id"], x=float(row["x"]), y=float(row["y"]), name=row["name"])
            
    def read_lines(self, lines_file):
        with open(lines_file, "r") as f:
            reader = csv.DictReader(f, delimiter=";")
            for row in reader:
                nodelist = row["stations"].split(",")
                for node in nodelist:
                    if node not in self.nodes:
                        print("Warning: Node {:s} is not in the graph.".format(node))
                self.add_line(row["id"], row["color"], nodelist)
               

# --- SCRIPT ---

N = LineNetwork()
N.read_stations(stations_file)
N.read_lines(lines_file)
N.draw(output_file)
