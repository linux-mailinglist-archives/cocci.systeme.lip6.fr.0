Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EBAE63F1
	for <lists+cocci@lfdr.de>; Sun, 27 Oct 2019 17:14:48 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9RGENwF007857;
	Sun, 27 Oct 2019 17:14:23 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4430877CA;
	Sun, 27 Oct 2019 17:14:23 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5368677AE
 for <cocci@systeme.lip6.fr>; Sun, 27 Oct 2019 17:14:21 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9RGEJhJ020154
 for <cocci@systeme.lip6.fr>; Sun, 27 Oct 2019 17:14:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,236,1569276000"; d="scan'208";a="324673688"
Received: from ppp-seco11pareq2-46-193-149-47.wb.wifirst.net (HELO hadrien)
 ([46.193.149.47])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 17:14:18 +0100
Date: Sun, 27 Oct 2019 17:14:18 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <258d568b-2783-9f13-d84d-37a84150432b@web.de>
Message-ID: <alpine.DEB.2.21.1910271713280.2623@hadrien>
References: <258d568b-2783-9f13-d84d-37a84150432b@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1074355972-1572192859=:2623"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 27 Oct 2019 17:14:26 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sun, 27 Oct 2019 17:14:19 +0100 (CET)
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1074355972-1572192859=:2623
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 27 Oct 2019, Markus Elfring wrote:

> Hello,
>
> I hoped to achieve something together with the semantic patch language
> by the following search pattern.
>
> @display@
> identifier action, driver;
> @@
>  static struct platform_driver driver =
>  {
>  <+...
> *.remove = action
>  ...+>
>  };
>
>
> Unfortunately, I stumble on another error message.
>
> elfring@Sonne:~/Projekte/Coccinelle/janitor> spatch --parse-cocci show_designated_initialisers6.cocci
> …
> minus: parse error:
>   File "show_designated_initialisers6.cocci", line 7, column 1, charpos = 91
>   around = '.',
>   whole content = *.remove = action
>
>
> How would you like to clarify the software behaviour for
> such an use case?

I don't know why you would even expect this to work.  .remove is not a
mainingful construct in the C language.  It is part of one, but it is not
a construct by itself.

julia
--8323329-1074355972-1572192859=:2623
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1074355972-1572192859=:2623--
