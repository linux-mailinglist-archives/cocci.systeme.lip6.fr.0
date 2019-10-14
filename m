Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E331D601D
	for <lists+cocci@lfdr.de>; Mon, 14 Oct 2019 12:24:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9EAOA6s024012;
	Mon, 14 Oct 2019 12:24:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6D92477C3;
	Mon, 14 Oct 2019 12:24:10 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E9D547792
 for <cocci@systeme.lip6.fr>; Mon, 14 Oct 2019 12:24:08 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9EAO8M0022369
 for <cocci@systeme.lip6.fr>; Mon, 14 Oct 2019 12:24:08 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,295,1566856800"; d="scan'208";a="322614843"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 12:24:08 +0200
Date: Mon, 14 Oct 2019 12:24:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <e6b2ca0d-1477-2528-afc1-34272e48b89a@web.de>
Message-ID: <alpine.DEB.2.21.1910141223120.2330@hadrien>
References: <alpine.DEB.2.21.1910112200230.3284@hadrien>
 <11a68d96-ace6-889b-596b-e34590b7b965@web.de>
 <alpine.DEB.2.21.1910131806400.2565@hadrien>
 <21abdc24-95d3-be59-0a93-4b60e790a239@web.de>
 <alpine.DEB.2.21.1910131836530.2565@hadrien>
 <e6b2ca0d-1477-2528-afc1-34272e48b89a@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-454809663-1571048648=:2330"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Oct 2019 12:24:11 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Mon, 14 Oct 2019 12:24:08 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Adjusting macros with SmPL?
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

--8323329-454809663-1571048648=:2330
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 14 Oct 2019, Markus Elfring wrote:

> > Changes within #define code should be supported if Coccinelle is able
> > to parse the code independently of its usage context.
>
> I suggest to take a closer look at the current software situation.
>
> @replacement@
> expression x;
> identifier macro;
> @@
>  #define macro(name)
> -snprintf
> +spgprintf_d
>  (...,
> -PAGE_SIZE, "%d\n",
>  (x)->name)
>
>
> elfring@Sonne:~/Projekte/Coccinelle/Probe> spatch --parse-cocci use_spgprintf2.cocci
> …
> minus: parse error:
>   File "use_spgprintf2.cocci", line 11, column 0, charpos = 132
>   around = '',
>   whole content =
>
>
> Can such an error message be explained better?
>
>
> I imagine that context-dependent data processing will be needed here
> to distinguish if preprocessor code should be adjusted (or not).
> How much will this technical aspect matter?

Macros are supposed to be written on one line.

Anyway, to my understanding the goal was not to modify the #define part,
but rather only the code part.

julia
--8323329-454809663-1571048648=:2330
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-454809663-1571048648=:2330--
