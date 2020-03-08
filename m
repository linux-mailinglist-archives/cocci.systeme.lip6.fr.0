Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E894917D43A
	for <lists+cocci@lfdr.de>; Sun,  8 Mar 2020 15:42:53 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 028EgRl5001438;
	Sun, 8 Mar 2020 15:42:27 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AFAEA7802;
	Sun,  8 Mar 2020 15:42:27 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C88DE7742
 for <cocci@systeme.lip6.fr>; Sun,  8 Mar 2020 15:42:25 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 028EgPHX000100
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 8 Mar 2020 15:42:25 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,530,1574118000"; d="scan'208";a="439369399"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Mar 2020 15:42:25 +0100
Date: Sun, 8 Mar 2020 15:42:24 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <127b687b-7139-e3b3-bc5a-13461609851c@web.de>
Message-ID: <alpine.DEB.2.21.2003081541140.2400@hadrien>
References: <127b687b-7139-e3b3-bc5a-13461609851c@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1255706079-1583678545=:2400"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 08 Mar 2020 15:42:29 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 08 Mar 2020 15:42:25 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking two error messages
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

--8323329-1255706079-1583678545=:2400
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Sun, 8 Mar 2020, Markus Elfring wrote:

> Hello,
>
> I have tried the following small script variant out again for
> the semantic patch language.
>
> @display@
> expression action;
> expression* pointer, target, x;
> identifier member, var;
> statement is;
> type t;
> @@
> (
> *t* var = pointer->member;
> |
> *pointer->member;
> |
> *target = pointer->member;
> |
> *t* var = pointer->member(...);
> |
> *pointer->member(...);
> |
> *target = pointer->member(...);
> )
>  ... when any
>      when != pointer = \( action(...) \| x \)
> *if (
> (    !pointer
> |    pointer == NULL
> )

pointer == NULL would have been sufficient (not related to the noted
problems).

>     )
>   is
>
>
> The software “Coccinelle 1.0.8-00029-ga549b9f0” (OCaml 4.10.0) reports the following error messages
> for an analysis approach on source files from “Linux next-20200306”.
>
>
> elfring@Sonne:~/Projekte/Linux/next-patched> spatch ~/Projekte/Coccinelle/janitor/show_pointer_access_before_null_check3.cocci drivers/firmware/efi/runtime-wrappers.c
> …
> Fatal error: exception File "engine/ctlcocci_integration.ml", line 361, characters 4-10: Assertion failed
> elfring@Sonne:~/Projekte/Linux/next-patched> spatch ~/Projekte/Coccinelle/janitor/show_pointer_access_before_null_check3.cocci net/core/dev.c
> …
> no position information

Thanks for the reports.  These are related to dead code and will be
addressed sooner (second case) or later (first case).

julia
--8323329-1255706079-1583678545=:2400
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1255706079-1583678545=:2400--
