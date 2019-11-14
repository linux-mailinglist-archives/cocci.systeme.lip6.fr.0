Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABDCFCA70
	for <lists+cocci@lfdr.de>; Thu, 14 Nov 2019 17:03:07 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAEG2lND023743;
	Thu, 14 Nov 2019 17:02:47 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 94FFC77DD;
	Thu, 14 Nov 2019 17:02:47 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5D54D77D4
 for <cocci@systeme.lip6.fr>; Thu, 14 Nov 2019 17:02:46 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAEG2j3x017119
 for <cocci@systeme.lip6.fr>; Thu, 14 Nov 2019 17:02:45 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,304,1569276000"; d="scan'208";a="411832803"
Received: from unknown (HELO hadrien) ([12.217.66.2])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 17:02:44 +0100
Date: Thu, 14 Nov 2019 08:02:41 -0800 (PST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <02066756-1db4-937f-9159-64bddcb4fd37@web.de>
Message-ID: <alpine.DEB.2.21.1911140802040.2239@hadrien>
References: <94469840-64e2-8189-db8f-c25b7efde2fa@web.de>
 <alpine.DEB.2.21.1911140732420.2239@hadrien>
 <02066756-1db4-937f-9159-64bddcb4fd37@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 14 Nov 2019 17:02:47 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 14 Nov 2019 17:02:46 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Using a metavariable type for function calls?
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



On Thu, 14 Nov 2019, Markus Elfring wrote:

> >> Some metavariable types are supported by the semantic patch language so far.
> >> Can it become helpful to let a customised function determine the concrete
> >> value which should be used for a source code transformation specification?
> >
> > I have no idea what you are asking for.
>
> @@
> my_function get_content;
> @@
> -old_stuff
> +get_content
>
>
> > You can already write code in python or ocaml scripts that binds metavariables
> > that you can use in later rules.
>
> Do you refer to scripted constraints here?

No.  Like in demos/pythontococci.cocci
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
