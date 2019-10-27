Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C85E6454
	for <lists+cocci@lfdr.de>; Sun, 27 Oct 2019 17:50:51 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9RGobOu026931;
	Sun, 27 Oct 2019 17:50:37 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5340877CA;
	Sun, 27 Oct 2019 17:50:37 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7A1AB77AE
 for <cocci@systeme.lip6.fr>; Sun, 27 Oct 2019 17:50:35 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9RGoZnx026555
 for <cocci@systeme.lip6.fr>; Sun, 27 Oct 2019 17:50:35 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,236,1569276000"; d="scan'208";a="408634886"
Received: from ppp-seco11pareq2-46-193-149-47.wb.wifirst.net (HELO hadrien)
 ([46.193.149.47])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 17:50:09 +0100
Date: Sun, 27 Oct 2019 17:50:08 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <alpine.DEB.2.21.1910271713280.2623@hadrien>
Message-ID: <alpine.DEB.2.21.1910271748500.2623@hadrien>
References: <258d568b-2783-9f13-d84d-37a84150432b@web.de>
 <alpine.DEB.2.21.1910271713280.2623@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 27 Oct 2019 17:50:37 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sun, 27 Oct 2019 17:50:35 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Searching designated initialisers with SmPL
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



On Sun, 27 Oct 2019, Julia Lawall wrote:

>
>
> On Sun, 27 Oct 2019, Markus Elfring wrote:
>
> > Hello,
> >
> > I hoped to achieve something together with the semantic patch language
> > by the following search pattern.
> >
> > @display@
> > identifier action, driver;
> > @@
> >  static struct platform_driver driver =
> >  {
> >  <+...
> > *.remove = action
> >  ...+>
> >  };

Sorry, I thought that the above code was in a function definition.

It should be:

static struct platform_driver driver = { . remove = acrtion, };

There is no need for any form of ...

On the other hand the trailing comma is required.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
