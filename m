Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E733A3D4
	for <lists+cocci@lfdr.de>; Sun, 14 Mar 2021 10:16:50 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 12E9GOxd008048;
	Sun, 14 Mar 2021 10:16:24 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 05C4177E4;
	Sun, 14 Mar 2021 10:16:24 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 614493BA2
 for <cocci@systeme.lip6.fr>; Sun, 14 Mar 2021 10:16:22 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 12E9GMrl013893
 for <cocci@systeme.lip6.fr>; Sun, 14 Mar 2021 10:16:22 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ABXoc+q+Uu2Pxv9DMwQtuk+ATI+orLtY04lQ7?=
 =?us-ascii?q?vn1ZYxpTb8CeioSSh/wdzxD5k3I8X3snlNCGNsC7MBHh3LRy5pQcOqrnYRn+tA?=
 =?us-ascii?q?KTQr1KwIP+z1TbexHW2fVa0c5bAstDIfnRKXQ/ssrg+gm/FL8br+Wv1Kyzn+/R?=
 =?us-ascii?q?wzNMQGhRCp1I1AtyBgaFHkAefmAvbvAEPaCB7clKrSfIQxgqR/m8b0NpY9T+?=
X-IronPort-AV: E=Sophos;i="5.81,245,1610406000"; d="scan'208";a="497797186"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Mar 2021 10:16:21 +0100
Date: Sun, 14 Mar 2021 10:16:21 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Wolfram Sang <wsa@kernel.org>
In-Reply-To: <20210314061001.GA993@kunai>
Message-ID: <alpine.DEB.2.22.394.2103141016010.2986@hadrien>
References: <CAOhcEPbTH-oTTn1OUkgoYf2GaBKaCYjwpWuhrdNRkNQ0uZ_r4A@mail.gmail.com>
 <20210314061001.GA993@kunai>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 14 Mar 2021 10:16:25 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 14 Mar 2021 10:16:22 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Replacing a struct member with a function call
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



On Sun, 14 Mar 2021, Wolfram Sang wrote:

>
> > @@
> > type M;
>
> This?
>
> struct monitor* m;
>
> > @@
> > - m->virtual.width;
> > + get_monitor_width();

I guess that m should be somewhere in teh call to get_monitor_width too?

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
