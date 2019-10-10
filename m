Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D12ECD2B85
	for <lists+cocci@lfdr.de>; Thu, 10 Oct 2019 15:39:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9ADcqPm007829;
	Thu, 10 Oct 2019 15:38:52 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DEC8077C0;
	Thu, 10 Oct 2019 15:38:51 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E62A077AD
 for <cocci@systeme.lip6.fr>; Thu, 10 Oct 2019 15:38:49 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9ADcnGP020363
 for <cocci@systeme.lip6.fr>; Thu, 10 Oct 2019 15:38:49 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,280,1566856800"; d="scan'208";a="322294693"
Received: from wifi-eduroam-85-039.paris.inria.fr ([128.93.85.39])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 15:38:46 +0200
Date: Thu, 10 Oct 2019 15:38:45 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <8df6513d-36d3-2049-8fb0-28d84c8f9c85@web.de>
Message-ID: <alpine.DEB.2.21.1910101537280.2305@hadrien>
References: <24130ec6-4a20-7be4-755f-a6dfffcb6c97@web.de>
 <alpine.DEB.2.21.1910101509370.2305@hadrien>
 <8df6513d-36d3-2049-8fb0-28d84c8f9c85@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 10 Oct 2019 15:38:52 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 10 Oct 2019 15:38:49 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Software analysis with SmPL around unchecked function
 calls
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



On Thu, 10 Oct 2019, Markus Elfring wrote:

> > Why not just
> >
> > x = kmemdup(...);
> > ... when != x
>
> I find this SmPL code exclusion specification too generic for the use case.
> I would like to detect that a corresponding null pointer check would be missing
> (before the data can be used for further data processing).

* x = kmemdup(...);
  ... when != x
(
  x->f
|
  f(...,<+...x...+>,...)
)

If this gives a parse error, put ... when any at the very end.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
