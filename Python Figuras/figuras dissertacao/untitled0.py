import matplotlib.pyplot as plt
import networkx as nx
G= nx.barabasi_albert_graph(6,1)
#nx.draw(G, with_labels=True,node_color='green')


pos = nx.spring_layout(G)  # positions for all nodes

# nodes
options = {"edgecolors": "tab:gray", "node_size": 1000, "alpha": 0.9}
nodes=nx.draw_networkx_nodes(G, pos, node_color="tab:green", **options)

nodes.set_edgecolor('k')

# edges
nx.draw_networkx_edges(G, pos, width=1.0, alpha=0.9,arrows= True)


# # some math labels
# labels = {}
# labels[0] = r"$a$"
# labels[1] = r"$b$"
# labels[2] = r"$c$"
# labels[3] = r"$d$"
# labels[4] = r"$\alpha$"
# labels[5] = r"$\beta$"
# labels[6] = r"$\gamma$"
# labels[7] = r"$\delta$"
#nx.draw_networkx_labels(G, pos,font_color="whitesmoke")

plt.tight_layout()
plt.axis("off")
plt.savefig('grafo2.png', dpi=300)
plt.show()

