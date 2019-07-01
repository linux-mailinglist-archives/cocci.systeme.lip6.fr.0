Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5342A76B
	for <lists+cocci@lfdr.de>; Sun, 26 May 2019 01:55:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4PNrXI1012929;
	Sun, 26 May 2019 01:53:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D73BA7760;
	Sun, 26 May 2019 01:53:32 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7C957774C
 for <cocci@systeme.lip6.fr>; Sun, 26 May 2019 01:53:31 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4PNrVrm010669
 for <cocci@systeme.lip6.fr>; Sun, 26 May 2019 01:53:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,512,1549926000"; d="scan'208";a="307212800"
Received: from unknown (HELO hadrien) ([207.96.196.254])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 01:53:30 +0200
Date: Sun, 26 May 2019 01:53:29 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <63bd01ee-ea4d-fcbe-dc07-98bc98347b1c@web.de>
Message-ID: <alpine.DEB.2.21.1905260152360.2816@hadrien>
References: <alpine.DEB.2.21.1905222114490.2618@hadrien>
 <81b409c6-5986-5961-5edf-843c6737d88c@web.de>
 <alpine.DEB.2.20.1905231500230.3573@hadrien>
 <b5c322d3-3162-953f-a985-53abc5064482@web.de>
 <alpine.DEB.2.21.1905251522470.2799@hadrien>
 <63bd01ee-ea4d-fcbe-dc07-98bc98347b1c@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-435899637-1558828410=:2816"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 May 2019 01:53:36 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sun, 26 May 2019 01:53:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] accessing comments
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

--8323329-435899637-1558828410=:2816
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sat, 25 May 2019, Markus Elfring wrote:

> >> “…
> >> let (c1b,c1m,c1a) = List.hd c1 in
> >> …”
> >>
> >>
> >> Can this programming approach result in undesirable data duplication?
> >
> > There is no data duplication.
>
> The involved data structures are unclear at the moment.
>
>
> > Learn about pointers.
>
> How many different pointers will refer to empty strings here?
>
>
>
> >> * Which texts would you expect for your variables “…m”?
> >
> > There is an example:
> >
> > c4b: /* a comment1 */
> > c4m: /*in arglist*/
> > c4a: /* a comment2 */
>
> How would you like to handle source code elements without
> parameter lists?

Parameter lists are irrelevant.  That is just an example.  As long as the
SmPL token matches more than one token, it is possible that there is a
comment between them.

julia
--8323329-435899637-1558828410=:2816
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-435899637-1558828410=:2816--
