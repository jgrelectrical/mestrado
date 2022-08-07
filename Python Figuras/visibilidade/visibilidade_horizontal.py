# -*- coding: utf-8 -*-
"""
Created on Wed Jul 27 17:38:20 2022

@author: jgrel
"""

from ts2vg import NaturalVG, HorizontalVG
from matplotlib.cm import ScalarMappable
from matplotlib.colors import Normalize
from matplotlib.patches import ArrowStyle, FancyArrowPatch


def plot_graph_demo(g, ax, title=None, weights_cmap='coolwarm_r', weights_range=(-3.5, 3.5), cbar_ax=None, arrow_heads='auto'):
    """
    Draw a simple plot of a time series and its corresponding visibility graph for demonstration purposes.
    Only practical for small graphs (smaller than ~20 nodes).

    Parameters
    ----------
    g : ts2vg.graph.BaseGraph
        Graph object.

    ax : Matplotlib ``Axes``
        Axes where to plot.

    title : str, None
        Plot title. Default ``None``.

    weights_cmap : str, Matplotlib ``Colormap`` object
        Colormap for coloring graph edges based on weight.
        Ignored for unweighted graphs.

    weights_range : tuple
        Range (min, max) used to normalize the coloring of the edge weights.
        Ignored for unweighted graphs.

    cbar_ax : Matplotlib ``Axes`` object
        Axes where to draw the colorbar.
        Ignored for unweighted graphs.

    arrow_heads: 'auto', bool
        Whether to draw arrow heads on the edges.
        If 'auto', will be based on the graph type.
    """
    color_mappable = ScalarMappable(norm=Normalize(*weights_range), cmap=weights_cmap)

    bars = ax.bar(g.xs, g.ts, color='green', edgecolor="#000", width=0.3)
    ax.set_xticks(g.xs)

    if arrow_heads is False or (arrow_heads == 'auto' and not g.is_directed):
        arrowstyle = ArrowStyle('-')
    elif g.is_directed:
        arrowstyle = ArrowStyle('-|>', head_length=6, head_width=3)
    else:
        arrowstyle = ArrowStyle('<|-|>', head_length=6, head_width=3)

    if g.is_weighted:
        if cbar_ax is not None:
            cbar_ax.get_figure().colorbar(color_mappable, cax=cbar_ax, orientation='vertical', aspect=30, pad=0.05)
        else:
            ax.get_figure().colorbar(color_mappable, ax=ax, orientation='vertical', aspect=30, pad=0.05)

    for (n1, n2, *w) in g.edges:
        if type(g) == NaturalVG:
            x1, y1 = g.xs[n1], g.ts[n1]
            x2, y2 = g.xs[n2], g.ts[n2]
        elif type(g) == HorizontalVG:
            y = min(g.ts[n1], g.ts[n2])

            if n1 < n2:
                x1, y1 = g.xs[n1] + bars[n1].get_width()/2, y
                x2, y2 = g.xs[n2] - bars[n2].get_width()/2, y
            else:
                x1, y1 = g.xs[n1] - bars[n1].get_width()/2, y
                x2, y2 = g.xs[n2] + bars[n2].get_width()/2, y
        else:
            raise ValueError(f"Visibility graph type {type(g)} not recognized for plotting.")

        arrow = FancyArrowPatch(
            (x1, y1), (x2, y2),
            arrowstyle=arrowstyle,
            shrinkA=0, shrinkB=0,
            color=color_mappable.to_rgba(*w, alpha=1) if g.is_weighted else (0.0, 0.0, 0.0, 0.7),
            linewidth=2,
            linestyle ='--',
        )

        ax.add_patch(arrow)

    if title is not None:
        ax.set_title(title)    
        
        
        


from ts2vg import HorizontalVG
import matplotlib.pyplot as plt
import numpy as np
import networkx as nx

ts = np.array([3.8,2.5,3.4,2.7,2.2,1.5,2.1,3.4,5.2])

# direction_options = [None]

fig, ax1 = plt.subplots()

# for d, ax in zip(direction_options, axs.flat):
g = HorizontalVG().build(ts)
plot_graph_demo(g, ax=ax1)
        
        
        
        
ax1.tick_params(labelsize=15)
ax1.set_ylabel(r'$x(t)$', fontsize=20)
ax1.set_xlabel(r'$t(s)$', fontsize=20)
ax1.grid(color="grey", linestyle="--", alpha=0.2,linewidth=0.5)

fig.tight_layout()

plt.savefig('visual_horizontal.pdf', dpi=300)

plt.show()        
        
      
nxg = g.as_networkx()        
  
pos=nx.circular_layout(nxg)      
options = {"edgecolors": "tab:gray", "node_size":1000, "alpha": 1}
nodes=nx.draw_networkx_nodes(nxg, pos, node_color="tab:green", **options)
nodes.set_edgecolor('k')


nx.draw_networkx_edges(nxg, pos,width=2, alpha=0.9,edge_color='k')

nx.draw_networkx_labels(nxg, pos,font_color="whitesmoke")



plt.tight_layout()
plt.axis("off")

plt.savefig('visual_horizontal_rede.pdf', dpi=300)

plt.show()  



        
        
        