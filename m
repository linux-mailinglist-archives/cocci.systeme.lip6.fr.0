Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF027740E
	for <lists+cocci@lfdr.de>; Thu, 24 Sep 2020 16:33:21 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08OEWYSv019094;
	Thu, 24 Sep 2020 16:32:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7EC3777BF;
	Thu, 24 Sep 2020 16:32:34 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0F3B74452
 for <cocci@systeme.lip6.fr>; Thu, 24 Sep 2020 16:32:32 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08OEWVG7026798
 for <cocci@systeme.lip6.fr>; Thu, 24 Sep 2020 16:32:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,298,1596492000"; d="scan'208";a="359963308"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 16:32:30 +0200
Date: Thu, 24 Sep 2020 16:32:30 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <67ad40bd-c0c0-8c5c-54b2-c750cfeefd44@web.de>
Message-ID: <alpine.DEB.2.22.394.2009241631310.2615@hadrien>
References: <67ad40bd-c0c0-8c5c-54b2-c750cfeefd44@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 24 Sep 2020 16:32:34 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 24 Sep 2020 16:32:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH] coccinelle: iterators: Add for_each_child.cocci
 script
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



On Thu, 24 Sep 2020, Markus Elfring wrote:

> > +@ruletwo depends on patch && !context && !org && !report@
>
> How do you think about to combine code from two SmPL rules
> by using another SmPL disjunction like the following?

What is the goal of doing this?

It seems substantially harder to understand than three rules that each
take care of a specific case.

julia


>
> @addition_rule depends on patch && !context && !org && !report@
> local idexpression r.n;
> expression e,e1;
> expression list [r.n1] es;
> iterator r.i,i1,i2;
> statement S,S2;
> @@
> (
>  i(es,n,...) {
>  ...
> (of_node_put(n);
> |e = n
> |return n;
> |i1(...,n,...) S
> |
> +of_node_put(n);
> ?return ...;
> )
>  ... when any
>  }
> |
>  i(es,n,...) {
>  ...
> (of_node_put(n);
> |e = n
> |i1(...,n,...) S
> |
> +of_node_put(n);
> ?break;
> )
>  ... when any
>  }
>  ... when != n
>      when strict
> (n = e1;
> |
> ?i2(...,n,...) S2
> )
> )
>
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
