Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B74D956F
	for <lists+cocci@lfdr.de>; Wed, 16 Oct 2019 17:23:57 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9GFNX0e016854;
	Wed, 16 Oct 2019 17:23:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C67B777CA;
	Wed, 16 Oct 2019 17:23:33 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 718ED7792
 for <cocci@systeme.lip6.fr>; Wed, 16 Oct 2019 17:23:31 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9GFNVff021191
 for <cocci@systeme.lip6.fr>; Wed, 16 Oct 2019 17:23:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,304,1566856800"; d="scan'208";a="322924271"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 17:23:30 +0200
Date: Wed, 16 Oct 2019 17:23:30 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <4c563b73-8482-06d9-6bee-3a06bbb7285b@web.de>
Message-ID: <alpine.DEB.2.21.1910161722550.3539@hadrien>
References: <alpine.DEB.2.21.1910112200230.3284@hadrien>
 <11a68d96-ace6-889b-596b-e34590b7b965@web.de>
 <alpine.DEB.2.21.1910131806400.2565@hadrien>
 <21abdc24-95d3-be59-0a93-4b60e790a239@web.de>
 <alpine.DEB.2.21.1910131836530.2565@hadrien>
 <e6b2ca0d-1477-2528-afc1-34272e48b89a@web.de>
 <alpine.DEB.2.21.1910141223120.2330@hadrien>
 <4c563b73-8482-06d9-6bee-3a06bbb7285b@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-365350734-1571239410=:3539"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 16 Oct 2019 17:23:35 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Wed, 16 Oct 2019 17:23:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Adjustments with SmPL after macros?
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

--8323329-365350734-1571239410=:3539
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 16 Oct 2019, Markus Elfring wrote:

> > Anyway, to my understanding the goal was not to modify the #define part,
> > but rather only the code part.
>
> Will it become supported by the semantic patch language to change
> source code directly after the occurrence of an empty macro?
>
> @replacement@
> identifier M;
> @@
>  #define M
> -snprintf
> +spgprintf_d
>  (...)

I think you could put \ in your semantic patch, like in C, but I don't
know.

julia

>
>
> elfring@Sonne:~/Projekte/Coccinelle/Probe> spatch --parse-cocci use_spgprintf5.cocci
> …
> minus: parse error:
>   File "use_spgprintf5.cocci", line 8, column 0, charpos = 72
>   around = '',
>   whole content =
>
>
> Regards,
> Markus
>
--8323329-365350734-1571239410=:3539
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-365350734-1571239410=:3539--
