Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA75263CA8
	for <lists+cocci@lfdr.de>; Thu, 10 Sep 2020 07:42:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08A5gRQB029964;
	Thu, 10 Sep 2020 07:42:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CA8C777BF;
	Thu, 10 Sep 2020 07:42:27 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9AC477595
 for <cocci@systeme.lip6.fr>; Thu, 10 Sep 2020 07:42:26 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08A5gQ1i016913
 for <cocci@systeme.lip6.fr>; Thu, 10 Sep 2020 07:42:26 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 5E77229B104
Message-ID: <c0923b23a65f024393bb2388c958d39e9f848fc6.camel@collabora.com>
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 10 Sep 2020 11:12:20 +0530
In-Reply-To: <b5578545-0567-8555-30db-d95a6b7bec1d@web.de>
References: <b5578545-0567-8555-30db-d95a6b7bec1d@web.de>
Organization: Collabora
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 10 Sep 2020 07:42:28 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 10 Sep 2020 07:42:26 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [RFC PATCH 1/3] parsing_c: includes_cache: Implement a
 name cache
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

On Wed, 2020-09-09 at 22:05 +0200, Markus Elfring wrote:
> > Implement a name cache and includes dependency graph to optimize
> > performance for recursive parsing of header files.
> 
> Can such information trigger any more evolution besides the
> contributed
> OCaml source code?
> 
> 
> >   The names of the above are stored in a "name cache", i.e. a
> > hashtable
> >   to map the name to the files it is declared in.
> 
> How much does hashing matter here?
> 

It's a hash table. I don't know how OCaml's Hashtbl works under the
hood.

> 
> > - A dependency graph is built to determine dependencies between all
> > the
> >  files in the codebase.
> 
> Can such information indicate a need for its own programming
> interface?
> 

If you mean graphs, there are entire modules for them in Coccinelle.
(commons/ograph_*.ml).

> 
> > - In the type annotation phase of the C subsystem, if a function
> > call,
> >   struct/union field or identifier is encountered, the type of
> > which is
> >   not known to the annoter, the name cache is checked for the name.
> 
> Is there anything in common with symbol tables?
> 

Kind of.

Cheers,
Jaskaran.

> Regards,
> Markus

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
