Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C851DFED5
	for <lists+cocci@lfdr.de>; Sun, 24 May 2020 14:06:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04OC5ujM022905;
	Sun, 24 May 2020 14:05:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D5AD47807;
	Sun, 24 May 2020 14:05:55 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 990C23D0F
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 14:05:54 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04OC5sgn027831
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 14:05:54 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,429,1583190000"; d="scan'208";a="349462403"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2020 14:05:53 +0200
Date: Sun, 24 May 2020 14:05:53 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <1d595042-0940-3056-5460-bffd58782fe2@web.de>
Message-ID: <alpine.DEB.2.21.2005241405010.2429@hadrien>
References: <1d595042-0940-3056-5460-bffd58782fe2@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1829764000-1590321953=:2429"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 24 May 2020 14:05:56 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 24 May 2020 14:05:54 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Converting variable initialisations to later assignments
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

--8323329-1829764000-1590321953=:2429
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 24 May 2020, Markus Elfring wrote:

> > > I am trying to move local variable initialization of some variable to
> > > first statement. …
>
> I find such a source code transformation task also interesting.
> But it points some software development challenges out also for the safe application
> of the semantic patch language for this use case.
>
>
> > put \(<+...a...+>\&E\) in place of E
>
> How do you think about the following SmPL script variant?
>
> @movement@
> expression E;
> identifier V1, V2, Vx;
> statement S;
> type T1, T2;
> @@
>  T1 V1;
>  ... when any
>  T2 V2
> -      = \( <+... Vx ...+> \& E \)

What is Vx for?  He wants an expression that involves a.

>  ;
>  ... when any
>      when != S
> ++ V2 = E;

What do you expect this code to be added on to?

julia

>
> elfring@Sonne:~/Projekte/Coccinelle/janitor> spatch --parse-cocci convert_variable_initialisation_to_assignment.cocci
> …
> plus: parse error:
>   File "convert_variable_initialisation_to_assignment.cocci", line 10, column 9, charpos = 117
>   around = '\(',
>   whole content = -      = \( <+... Vx ...+> \& E \)
>
>
> I have tried another SmPL code variation out then.
>
> -T2 V2 = \( <+... Vx ...+> \& E \)
> +T2 V2
>  ;
>
> elfring@Sonne:~/Projekte/Coccinelle/janitor> spatch --parse-cocci convert_variable_initialisation_to_assignment2.cocci
> …
> 14: no available token to attach to
>
>
> How will the software evolution be continued here?
>
> Regards,
> Markus
>
--8323329-1829764000-1590321953=:2429
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1829764000-1590321953=:2429--
