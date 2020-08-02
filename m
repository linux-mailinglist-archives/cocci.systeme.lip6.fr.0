Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 805522355CD
	for <lists+cocci@lfdr.de>; Sun,  2 Aug 2020 09:09:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 072797Th000532;
	Sun, 2 Aug 2020 09:09:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4A5E477BC;
	Sun,  2 Aug 2020 09:09:07 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CB0C94084
 for <cocci@systeme.lip6.fr>; Sun,  2 Aug 2020 09:09:05 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 072795wr008038
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 2 Aug 2020 09:09:05 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,425,1589234400"; d="scan'208";a="355791197"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 09:09:04 +0200
Date: Sun, 2 Aug 2020 09:09:04 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <3aea12cf-68dc-e140-936f-cfefb2adbc8f@web.de>
Message-ID: <alpine.DEB.2.22.394.2008020907220.2531@hadrien>
References: <3aea12cf-68dc-e140-936f-cfefb2adbc8f@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-429177205-1596352144=:2531"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 02 Aug 2020 09:09:07 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 02 Aug 2020 09:09:05 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH v6] coccinelle: api: add kvfree script
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-429177205-1596352144=:2531
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 2 Aug 2020, Markus Elfring wrote:

> …
> > +++ b/scripts/coccinelle/api/kvfree.cocci
> …
> > +@choice@
> > +expression E, E1;
> > +position kok, vok;
> > +@@
> > +
> > +(
> …
> > +|
> > +  E = \(kmalloc\|kzalloc\|krealloc\|kcalloc\|kmalloc_node\|kzalloc_node\|
> > +        kmalloc_array\|kmalloc_array_node\|kcalloc_node\)(...)@kok
> > +  ... when != E = E1
> > +      when any
> > +  if (\(!E\|E == NULL\)) {
> …
>
> Can the SmPL code exclusion specification be incomplete here?
>
> How do you think about to check also if the memory is passed to any function
> (or macro) calls before the shown detection of a null pointer?

It seems both extremely unlikely and not relevant to the question at hand.
Passing E to another function will not change the value of E itself.
Passing &E to another function could change E, but it would be very
unusual to do that, and doesn't seem worth checking for.

julia
--8323329-429177205-1596352144=:2531
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-429177205-1596352144=:2531--
